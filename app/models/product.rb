class Product < ActiveRecord::Base
	belongs_to :category
	belongs_to :photo

	validates :title, :category_id, presence: true#, :price, :stock, :photo

	# 
	#def public_serialized_response
	#	{ 
	#		title: self.title,
	#		category: {
				# Since the category is associated, there's no
				# need to find it in the database
	#			name: Category.name
	#		}
	#	}
	#end
end
