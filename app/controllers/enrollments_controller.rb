class EnrollmentsController < ApplicationController
	before_action :authenticate_user!



	def create 
		@enrollments = current_user.enrollments.build(enrollment_params)
		if @enrollments.save 
			flash[:success] = "You have successfully enrolled."
			redirect_to profile_path(current_user)
		else 
			redirect_to profile_path(current_user)
		end
	end

	private

		def enrollment_params 
			params.require(:enrollment).permit(:user_id, :lecture_id)
		end


end
