class EnrollmentsController < ApplicationController
	before_action :authenticate_user!, except: [:new]
	before_action :redirect_to_signup, only: [:new]


	def new
		@lecture = Lecture.find(params[:lecture_id])
		@enrollments = Enrollment.all
		@enrollment = Enrollment.new(user_id: current_user.id, lecture_id: @lecture.id)
		@disable_navbar = true 
		@disable_footer = true	

		if @enrollments.where(user_id: current_user.id, lecture_id: @lecture.id).present?
			flash[:error] = "You're already enrolled to this class"
	        redirect_to profile_path(current_user)
	      else
	        render :new

		  end

	end

	def show
		@enrollment = current_user.enrollments.find(params[:id])
	    respond_to do |format|
	      format.pdf {
	        send_data @enrollment.receipt.render,
	          filename: "#{@enrollment.created_at.strftime("%Y-%m-%d")}-workshopr-receipt.pdf",
	          type: "application/pdf",
	          disposition: :inline,
	          orientation: 'Landscape',
	          encoding: utf-8
	      }
    end
  end

	def create 
		@disable_navbar = true 
		@disable_footer = true
		
		@lecture = Lecture.find_by(params[:id])
		@enrollment = Enrollment.new(enrollment_params)
		charge_error = nil

	    if @enrollment.valid?
	    begin

	     # Amount in cents
		  @amount = @lecture.amount
		  @final_amount = @amount

		  @code = params[:couponCode]

		  if !@code.blank?
		    @discount = get_discount(@code)

		    if @discount.nil?
		      flash[:error] = 'Coupon code is not valid or expired.'
		      redirect_to new_charge_path
		      return
		    else
		      @discount_amount = @amount * @discount
		      @final_amount = @amount - @discount_amount.to_i
		    end

		    charge_metadata = {
		      :coupon_code => @code,
		      :coupon_discount => (@discount * 100).to_s + '%'
		    }
		  end

		  charge_metadata ||= {}

		  customer = Stripe::Customer.create(
		    :email => params[:stripeEmail],
		    :source  => params[:stripeToken]
		  )
		  Stripe::Charge.create(
		    :customer    => customer.id,
		    :amount      => @final_amount,
		    :description => @lecture.title,
		    :currency    => 'usd',
		    :metadata    => charge_metadata
		  )
		rescue Stripe::CardError => e
		  flash[:error] = charge_error
		  redirect_to new_charge_path
		end

		

	    if charge_error
	      flash[:error] = charge_error
	      render :new
	    else	
	      @enrollment.save
	      ConfirmationEnrollmentMailer.confirmation_enrollment(current_user, @lecture, @enrollment).deliver
	      redirect_to profile_path(current_user)
		  flash[:success] = "You have successfully enrolled."
		  require 'slack-notifier'
	      notifier = Slack::Notifier.new "https://hooks.slack.com/services/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", channel: '#workshopr-general',
	                                              username: 'Dean Notifier'
	      notifier.ping "#{current_user.email} has enrolled to #{@lecture.title} !"
	    end
	  else
	    flash[:error] = 'You have already registered for this class'
	    render :new
	  end
	end

	private

		def enrollment_params 
			params.require(:enrollment).permit(:user_id, :lecture_id)
		end

		def redirect_to_signup
			if !user_signed_in?
				session["user_return_to"] = new_enrollment_path
				redirect_to new_user_registration_path
			end
		end

		COUPONS = {
  'RAVINGSAVINGS' => 0.20,
  'SUMMERSALE' => 0.50
}

def get_discount(code)
  # Normalize user input
  code = code.gsub(/ +/, '')
  code = code.upcase
  COUPONS[code]
end



end