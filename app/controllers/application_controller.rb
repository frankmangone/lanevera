class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :create_cart

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

  private

    def create_cart
      # Generate cart if the user doesn't have one
      if current_user
        if !current_user.cart
          # No existent cart / undelivered cart
          cart = current_user.build_cart
          cart.save
        end
      end
    end
end
