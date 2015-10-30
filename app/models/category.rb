class Category < ActiveRecord::Base
	has_many :products, dependent: :destroy

	validates :name, presence: true

	def destroy_product_images
		products.each do |p|
			p.photo.destroy
		end
	end

	# Search by possible filters (2)
	def self.search(category_id, search)
		if category_id
			find(category_id).products.search(search)
		else
			Product.search(search)
		end
	end

end
