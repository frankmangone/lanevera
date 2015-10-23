module CartsHelper

	def handle_item_addition(product_id)
		# Basically work with a two-dimensional array that saves both
		# product id and the amount of that product the buyer wants.

		# That combination is what I call an "Item" in the Cart.
		# For instance: [[14, 3], [11,1], [21,5]]

		# Dunno why but the id is passed as string here.
		product_id = product_id.to_i

		if cart_empty?
			# Initialize
			session[:cart] = []
			session[:cart] << { id: product_id, amount: 1 }
		else
			add_to_non_empty_cart product_id
		end

	end


	def handle_item_deletion(product_id)
		# The front end only allows this to happen if there is an actual item to delete
		product_id = product_id.to_i

		session[:cart].each_with_index do |item, index|
			if item["id"] == product_id
				session[:cart][index]["amount"] -= 1

				if session[:cart][index]["amount"] == 0
					# Remove element from cart.
					session[:cart].delete_at(index)
				end	
			end
		end
	end


	def item_amount(product_id)
		# Count how many products are there on a given item
		amount = 0

		if !cart_empty?
			session[:cart].each do |item|
				if item["id"] == product_id
					# If found returns product amount
					amount = item["amount"]
				end
			end
		end

		amount
	end
	

	def total_price
		# Total price of items in cart
		if !cart_empty?
			total = 0

			session[:cart].each do |item|
				total += Product.find(item["id"]).price * item["amount"]
			end

			"$" + total.to_s
		else
			"$0"
		end
	end

	private

	def cart_empty?
		!session[:cart]	
	end

	def add_to_non_empty_cart(product_id)
		# Search through the cart to see if the product is already present.
		present = false

		session[:cart].each_with_index do |item, index|
			if item["id"] == product_id
				present = true
				session[:cart][index]["amount"] += 1
			end
		end

		if !present
			session[:cart] << { id: product_id, amount: 1 }
		end
		
	end
end
