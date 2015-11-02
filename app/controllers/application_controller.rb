class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include CartsHelper
  include ApplicationHelper

  # Inherited methods

  # Checks if there exists a logged in admin
	def logged_in_admin
		unless current_user_admin?
			flash[:error] = "No tienes permiso para realizar esa acción."
			redirect_to products_path
		end
	end
end
