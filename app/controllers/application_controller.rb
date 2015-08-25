class ApplicationController < ActionController::Base
	
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end


  def after_sign_in_path_for(resource)
    # redirect to lecture/admin for admins
    profile_path(current_user)
  end

  def after_sign_out_path_for(resource)
    # return the path based on resource
    pages_signout_path
  end

  def after_update_path_for(resource)
      profile_path(current_user)
  end
 
  
    
end
