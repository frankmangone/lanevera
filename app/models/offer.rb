class Offer < ActiveRecord::Base

	belongs_to :product

	validates :price, presence: true, numericality: { greater_than: 0 }
	validate  :offer_lower_than_price 

	def write_price
		"$" +	price.to_s
	end

	private

		def offer_lower_than_price
			if self.price
				if self.price > self.product.price
					self.errors[:price] << "La oferta debe ser menor al precio original"
				end
			end
		end

end
