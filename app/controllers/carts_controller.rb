class CartsController < ApplicationController

	def show

	end

	def add_item
		handle_item_addition params[:product_id]

		respond_to do |format|
			format.js
		end
	end

	def remove_item
		handle_item_deletion params[:product_id]

		respond_to do |format|
			format.js
		end
	end

end
