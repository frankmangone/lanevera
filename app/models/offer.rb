class Offer < ActiveRecord::Base
	belongs_to :product

	validates :price, presence: true

	def write_price
		"$" +	price.to_s
	end
end
