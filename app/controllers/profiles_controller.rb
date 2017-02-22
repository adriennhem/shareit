class ProfilesController < ApplicationController
before_action :authenticate_user!
layout "dashboard"

def show
	@invited_users = User.where(invited_by: current_user.id)
	@disable_footer = true
	if current_user.student?
		@enrollments = current_user.enrollments.order(created_at: :asc)
		@lectures = Lecture.all
		@enrollment = Enrollment.new
	else 
		@projects = current_user.project_selling.order(created_at: :asc)
	end
end


def user_projects
	@disable_footer = true
end

end