class EnrollmentsController < ApplicationController
	before_action :authenticate_user!, except: [:new]
	before_action :redirect_to_signup, only: [:new]

	def new
		@lecture = Lecture.find_by(params[:lecture_id])
		@enrollment = Enrollment.new(lecture_id: @lecture.id, user_id: current_user.id)
	end


	def create 
		@lecture = Lecture.find_by(params[:id])
		@enrollment = Enrollment.new(lecture_id: @lecture.id, user_id: current_user.id)
	    charge_error = nil

	    if @enrollment.valid?
	    begin
	      customer = Stripe::Customer.create(
	        :email => 'example@stripe.com',
	        :card  => params[:stripeToken])

	      charge = Stripe::Charge.create(
	        :customer    => customer.id,
	        :amount      => 5000,
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
			params.require(:enrollment).permit(:user_id, :lecture_id)
		end

		def redirect_to_signup
			if !user_signed_in?
				session["user_return_to"] = new_enrollment_path
				redirect_to new_user_registration_path
			end
		end

		

end
