class Product < ActiveRecord::Base
	belongs_to :category
	belongs_to :photo, dependent: :destroy
	has_one    :offer, dependent: :destroy
	has_many   :items, dependent: :destroy

	validates :title,       presence: true
	validates :category_id, presence: true
	validates :price,       presence: true, numericality: { greater_than: 0 }
	validates :photo_id,    presence: true

	def self.search(search)
		if search != "" && search
			where('lower(title) = ?', search.downcase)
		else
			all
		end
	end

	def write_price
		"$" +	price.to_s
	end

end
