class Users::RegistrationsController < Devise::RegistrationsController
  
  before_filter :configure_permitted_parameters

  def create
  	super
  	
    flash[:success] = resource.first_name # ????

    if resource.save
      flash[:success] = "¡Tu usuario ha sido creado correctamente!"
    else

    end
  end

  protected

  def configure_permitted_parameters

    registration_params = [:first_name, :last_name, :email, :password, :password_confirmation]

    devise_parameter_sanitizer.for(:sign_up) {
        |u| u.permit(registration_params)
      }

  end
end
