class ApplicationController < ActionController::Base
  before_filter :configure_permitted_parameters, if: :devise_controller?
  layout :layout_by_resource
	include Pundit
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  

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

   def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) << :picture
    devise_parameter_sanitizer.for(:sign_up) << :role 

  end

  def layout_by_resource
    if devise_controller?
      "devise_layout"
    else
      "application"
    end
  end

 
  
end
