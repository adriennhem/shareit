class ProfilesController < ApplicationController
before_action :authenticate_user!
layout "dashboard"

def show
	@projects = current_user.projects.all 
	@user = current_user
	@disable_footer = true
end

end