class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_filter :expire_hsts
  before_action :set_locale 
  layout :layout_by_resource
	include Pundit
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  

  def after_sign_in_path_for(resource)
    if current_user.admin?
      admin_dashboard_path
    else
      profile_path(current_user)
    end
  end

  def after_sign_out_path_for(resource)
    # return the path based on resource
    root_path
  end

   def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update) {|u| u.permit(
    :name,
    :picture
  )}
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(
      :email,
      :password,
      :password_confirmation,
      :role,
      :name)
    }
  end

  def layout_by_resource
    if devise_controller?
      "devise_layout"
    else
      "application"
    end
  end

  def disable_footer 
    @disable_footer = true
  end 

  def disable_navbar
    @disable_navbar = true 
  end 



def set_locale
  if cookies[:workshopr_locale] && I18n.available_locales.include?(cookies[:workshopr_locale].to_sym)
    l = cookies[:workshopr_locale].to_sym
  else
    l = I18n.default_locale
    cookies.permanent[:workshopr_locale] = l
  end
  I18n.locale = l
end

private
  def expire_hsts
    response.headers["Strict-Transport-Security"] = 'max-age=0'
  end

 
  
end
