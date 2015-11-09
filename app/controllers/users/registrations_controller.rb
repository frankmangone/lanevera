class Users::RegistrationsController < Devise::RegistrationsController
  
  respond_to :html, :js

  before_filter :configure_permitted_parameters
  before_action :valid_location

  def new
    # Devise is crazy
  	resource = build_resource({})
    resource.build_location
    respond_with resource
  end

  protected

  def configure_permitted_parameters

    registration_params = [:first_name, :last_name, :email, :address, :phone, :password, :password_confirmation, location_attributes: [:id, :latitude, :longitude]]

    devise_parameter_sanitizer.for(:sign_up) {
        |u| u.permit(registration_params)
      }

  end

  def valid_location

  end
end
