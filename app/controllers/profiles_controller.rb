class ProfilesController < ApplicationController
before_action :authenticate_user!
layout "dashboard"

def show
	@disable_footer = true
	if current_user.student?
		@enrollments = current_user.enrollments.order(created_at: :asc)
	else 
		@projects = current_user.project_selling.order(created_at: :asc)
	end
end


def user_projects
	@user = current_user
	@projects = Project.includes(:offers_made).where(user_id: @user.id)
	@disable_footer = true
	
end

end