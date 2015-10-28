class Users::RegistrationsController < Devise::RegistrationsController
  
  before_filter :configure_permitted_parameters

  protected

  def configure_permitted_parameters

    registration_params = [:first_name, :last_name, :email, :password, :password_confirmation]

    devise_parameter_sanitizer.for(:sign_up) {
        |u| u.permit(registration_params)
      }

  end
end
