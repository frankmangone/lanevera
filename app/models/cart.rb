class Cart < ActiveRecord::Base

	has_many   :items, dependent: :destroy
	belongs_to :user

	# Checks if a certain user is the owner of the cart
	def owner?(user)
		user.id == self.user.id
	end

	# Returns string with price ready to show
	def write_price
		"$ #{price}"
	end

	# Returns string with total product amount
	def write_product_total
		amount = product_total
		if amount == 1
			"1 artículo"
		else
			"#{amount} artículos"
		end
	end

	# Returns total amount of products in cart
	def product_total
		total = 0
		self.items.each do |item|
			total += item.amount
		end
		total
	end
end
