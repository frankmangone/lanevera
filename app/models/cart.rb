class Cart < ActiveRecord::Base

	has_many   :items, dependent: :destroy
	belongs_to :user

	CANCEL_MIN_CHARS = 15
	CANCEL_MAX_CHARS = 400

	validate :cancel_reason_valid

	# Checks if cart is empty
	def empty?
		self.items
	end

	# Checks if a certain user is the owner of the cart
	def owner?(user)
		user.id == self.user.id
	end


	# Gets total price of cart
	def price
		value = 0
		self.items.each do |item|
			value += item.product.price * item.amount
		end
		value
	end


	# Returns total amount of products in cart
	def product_total
		total = 0
		self.items.each do |item|
			total += item.amount
		end
		total
	end

	private

		def cancel_reason_valid
			if self.cancelled
				if self.cancel_reason.blank?
					self.errors[:cancel_reason] << "Debes escribir una razón por la cancelación"
				elsif self.cancel_reason.length < CANCEL_MIN_CHARS
					self.errors[:cancel_reason] << "Texto muy corto, usar al menos #{CANCEL_MIN_CHARS} caracteres"
				elsif self.cancel_reason.length > CANCEL_MAX_CHARS
					self.errors[:cancel_reason] << "Texto muy largo, el máximo es #{CANCEL_MAX_CHARS} caracteres"
				end
			end
		end

end
