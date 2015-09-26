class ProfilesController < ApplicationController
before_action :authenticate_user!
layout "dashboard"

def show

	@user = current_user
	@disable_footer = true
	respond_to do |format|
      format.html # renders show.html.erb
      format.js   # renders show.js.erb
    
    end
  
end

end