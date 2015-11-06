class CartsController < ApplicationController

	before_action :find_cart,       only: [:show, :purchase, :confirm, :mark_delivered]
	before_action :logged_in_admin, only: [:index, :purchase, :mark_delivered]
	before_action :cart_owner_or_admin_if_confirmed, only: :show
	before_action :cart_owner,      only: :confirm

	def index
		# Only select confirmed carts.
		@carts = Cart.where(confirmed: true)
	end

	def show
		if current_user_admin? && !@cart.owner?(current_user)
			redirect_to purchase_path(params[:id])
		end
	end

	# Show for admins so that they can build the real life delivery.
	def purchase

	end

	def confirm
		@cart.update(confirmed: true)
		redirect_to cart_path(params[:id])
	end

	def mark_delivered
		@cart.update(delivered: true)
		respond_to do |format|
			format.js
		end
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

		def find_cart
			@cart = Cart.find(params[:id])
		end


		def cart_owner
			cart = Cart.find(params[:id])

			unless cart.owner?(current_user)
				flash[:error] = "No tienes permiso para realizar esta acción."
				redirect_to products_path
			end
		end


		# Checks if current user is owner, or admin in case the cart is confirmed.
		def cart_owner_or_admin_if_confirmed
			cart = Cart.find(params[:id])

			if !cart.owner?(current_user)
				if !current_user_admin?
					flash[:error] = "No tienes permiso para realizar esa acción."
					redirect_to products_path
				else
					if !cart.confirmed
						flash[:notice] = "Esta compra aún no ha sido confirmada."
						redirect_to products_path
					end
				end
			end
		end
	
end
