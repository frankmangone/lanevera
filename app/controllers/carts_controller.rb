class CartsController < ApplicationController

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
	
end
