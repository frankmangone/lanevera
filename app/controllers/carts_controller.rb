class CartsController < ApplicationController

	before_action :find_cart,       only: [:show, :purchase, :mark_confirmed, :mark_delivered, :mark_cancelled, :cancel, :destroy, :rate]
	before_action :logged_in_admin, only: [:index, :purchase, :mark_delivered, :mark_cancelled, :destroy, :rate]
	before_action :cart_owner,      only: :mark_confirmed
	before_action :cart_owner_or_admin_if_confirmed, only: :show
	before_action :not_cancelled_nor_delievered,     only: [:mark_delivered, :mark_cancelled, :cancel]

	def index
		# Only select confirmed carts.
		@carts = Cart.where(confirmed: true).paginate(page: params[:page], per_page: 4)
	end

	def show
		if current_user_admin? && !@cart.owner?(current_user)
			redirect_to purchase_path(params[:id])
		end
	end

	def destroy
		@cart.destroy
		redirect_to purchases_path
	end

	# Show for admins so that they can build the real life delivery.
	def purchase

	end

	# Status change options

	def mark_confirmed
		@cart.update(confirmed: true)
		redirect_to cart_path(params[:id])
	end

	def mark_delivered
		@cart.update(delivered: true)
		redirect_to purchases_path
	end

	def mark_cancelled
		respond_to do |format|
			@cart.update(cart_params)
			format.js
		end
	end

	# Rate purchase

	def rate
		@cart.update(rating: params[:rating])
		respond_to do |format|
			format.js { render nothing: true }
		end
	end

	# Cancel view
	def cancel

	end

	# Item management

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

		def cart_params 
			# Only used for the cancel action
			params.require(:cart).permit(:cancel_reason, :cancelled)
		end


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


		def not_cancelled_nor_delievered
			cart = Cart.find(params[:id])

			if cart.cancelled || cart.delivered
				flash[:error] = "Ya no es posible realizar esta acción"
				redirect_to root_path
			end
		end
	
end
