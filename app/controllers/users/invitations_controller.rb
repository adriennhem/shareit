class Users::InvitationsController < Devise::InvitationsController
	def create
	 params[:user_emails].split(",").each do |email|
	    User.invite!({email: email}, current_user)
     end
       redirect_to profile_path(current_user)
	end
end
