class RegistrationsController < Devise::RegistrationsController
  layout 'devise_layout', except: [:update]
  layout 'dashboard', only: [:update]
  before_filter :no_header_footer



  protected



   def after_update_path_for(resource)
      edit_user_registration_path
    end

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  def no_header_footer 
  	@disable_footer = true 
  	@disable_header = true
  end
end
