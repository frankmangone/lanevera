class Offer < ActiveRecord::Base
	belongs_to :product

	def write_price
		"$" +	price.to_s
	end
end
