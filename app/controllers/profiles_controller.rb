class ProfilesController < ApplicationController
before_action :authenticate_user!
layout "dashboard"

def show
	@user = current_user
	@projects = Project.all
	@disable_footer = true
end

end