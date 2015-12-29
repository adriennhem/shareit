class EnrollmentsController < ApplicationController
	before_action :authenticate_user!, except: [:new]
	before_action :redirect_to_signup, only: [:new]
	# before_filter :sanitize_params


	def new

		@lecture = Lecture.find(params[:lecture_id])
		@disable_navbar = true 
		@disable_footer = true
		@enrollment = Enrollment.new
	end

	def show
		@enrollment = current_user.enrollments.find(params[:id])
	    respond_to do |format|
	      format.pdf {
	        send_data @enrollment.receipt.render,
	          filename: "#{@enrollment.created_at.strftime("%Y-%m-%d")}-workshopr-receipt.pdf",
	          type: "application/pdf",
	          disposition: :inline
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
  		@amount = params[:stripeAmount]
	      customer = Stripe::Customer.create(
	        :email => current_user.email,
	        :card  => params[:stripeToken])

	      charge = Stripe::Charge.create(
	        :customer    => customer.id,
	        :amount      => @amount,
	        :description => 'Rails Stripe customer',
	        :currency    => 'usd')

	   

	      rescue Stripe::CardError => e
	      charge_error = e.message
	      end

	    if charge_error
	      flash[:error] = charge_error
	      render :new
	    else	
	      @enrollment.save
	      ConfirmationEnrollmentMailer.confirmation_enrollment(current_user, @lecture, @enrollment).deliver
	      redirect_to profile_path(current_user)
		  flash[:success] = "You have successfully enrolled."
	    end
	  else
	    flash[:error] = 'You have already registered for this class'
	    render :new
	  end
	end

	private

		def enrollment_params 
			params.require(:enrollment).permit(:user_id, :lecture_id, :amount)
		end

		def redirect_to_signup
			if !user_signed_in?
				session["user_return_to"] = new_enrollment_path
				redirect_to new_user_registration_path
			end
		end

	
		# def sanitize_params
		# 	params[:amount] = params[:amount].to_i
		# end

end