class Product < ActiveRecord::Base
	belongs_to :category
	belongs_to :photo, dependent: :destroy
	has_one    :offer, dependent: :destroy
	has_many   :items, dependent: :destroy

	validates :title, :price, :category_id, presence: true

	def self.search(search)
		if search
			where("title LIKE ?", "%#{search}%")
		else
			all
		end
	end

	def write_price
		"$" +	price.to_s
	end

end
