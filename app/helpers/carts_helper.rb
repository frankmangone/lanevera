module CartsHelper

	def item_amount(product_id)
		# Count how many products are there on a given item
		amount = 0

		item = Item.where(cart_id: current_user.cart.id, product_id: product_id)
		item = item.first
		
		if item
			amount = item.amount
		end

		amount
	end

end
