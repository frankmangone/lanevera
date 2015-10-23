class CartsController < ApplicationController

	def show
		@cart = []

		if !cart_empty?
			session[:cart].each do |item|
				product = Product.find(item["id"])
				@cart << { product: product, amount: item["amount"] }
			end
		end
	end

	def add_item
		handle_item_addition params[:product_id]

		respond_to do |format|
			if params[:from] == "products"
				format.js { render 'add_item_products.js.erb' }
			elsif params[:from] == "cart"
				format.js { render 'add_item_cart.js.erb' }
			end
		end
	end

	def remove_item
		handle_item_deletion params[:product_id]

		respond_to do |format|
			if params[:from] == "products"
				format.js { render 'remove_item_products.js.erb' }
			elsif params[:from] == "cart"
				format.js { render 'remove_item_cart.js.erb' }
			end
		end
	end
	
end
