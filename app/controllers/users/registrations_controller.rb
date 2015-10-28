class Users::RegistrationsController < Devise::RegistrationsController
  
  before_filter :configure_permitted_parameters

  def new
    # Devise is crazy
  	resource = build_resource({})
    resource.build_location
    respond_with resource

    # Previously:
  	# super needs to be the last call for the instance variable above to work
  	# super	
  end

  protected

  def configure_permitted_parameters

    registration_params = [:first_name, :last_name, :email, :password, :password_confirmation, location_attributes: [:id, :latitude, :longitude]]

    devise_parameter_sanitizer.for(:sign_up) {
        |u| u.permit(registration_params)
      }

  end
end
