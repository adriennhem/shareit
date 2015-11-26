class ProfilesController < ApplicationController
before_action :authenticate_user!
layout "dashboard"

def show
	@user = current_user
	@projects = @user.project_selling.all
	@disable_footer = true
end

end