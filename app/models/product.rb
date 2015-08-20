class Product < ActiveRecord::Base
	belongs_to :category
	# METER IMAGEN Y VER SI SIRVE IMAGEMAGICK LA PUTA MADRE
	validates :title, :category_id, presence: true#, :price, :stock
end
