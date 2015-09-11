class Product < ActiveRecord::Base
	belongs_to :category
	belongs_to :photo, dependent: :destroy

	validates :title, :price, :category_id, presence: true#, :stock

	def self.search(search)
		if search
			where("title LIKE ?", "%#{search}%")
		else
			all
		end
	end
end
