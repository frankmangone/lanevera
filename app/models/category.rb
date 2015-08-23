class Category < ActiveRecord::Base
	has_many :products, dependent: :destroy

	validates :name, presence: true

	def destroy_product_images
		products.each do |p|
			p.photo.destroy
		end
	end
end
