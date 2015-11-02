class CartsController < ApplicationController

	before_action :logged_in_admin, only: :index
	before_action :cart_owner_or_admin_if_confirmed,  only: :show

	def index

	end

	def show
		@cart = current_user.cart
	end

	def add_item
		@product_id = params[:product_id]
		current_user.add_to_cart @product_id

		respond_to do |format|
			if params[:from] == "products"
				format.js { render 'add_item_products.js.erb' }
			elsif params[:from] == "cart"
				@total_price = current_user.cart.price
				format.js { render 'add_item_cart.js.erb' }
			end
		end
	end

	def remove_item
		@product_id = params[:product_id]
		current_user.remove_from_cart @product_id

		respond_to do |format|
			if params[:from] == "products"
				format.js { render 'remove_item_products.js.erb' }
			elsif params[:from] == "cart"
				@total_price = current_user.cart.price
				format.js { render 'remove_item_cart.js.erb' }
			end
		end
	end

	private

		# Checks if current user is owner, or admin
		def cart_owner_or_admin_if_confirmed
			cart = Cart.find(params[:id])

			if !cart.owner?(current_user)

				if !current_user_admin?
					flash[:error] = "No tienes permiso para realizar esa acción."
					redirect_to products_path
				else
					if !cart.confirmed
						flash[:notice] = "Este carro aún no ha sido confirmado."
						redirect_to products_path
					end
				end
			end

		end
	
end
