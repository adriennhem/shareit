class ProfilesController < ApplicationController
before_action :authenticate_user!
layout "dashboard"

def show
	@user = current_user
	@enrollments = @user.enrollments.all
	@projects = Project.all
	@disable_footer = true
end


def user_projects
	@user = current_user
	@projects = Project.includes(:offers_made).where(user_id: @user.id)
	@disable_footer = true
	
end

end