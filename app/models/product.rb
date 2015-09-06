class Product < ActiveRecord::Base
	belongs_to :category

	has_attached_file :photo,
										storage: :dropbox,
										dropbox_credentials: Rails.root.join("config/dropbox.yml"),
										dropbox_visibility: 'public'

	validates_attachment_presence     :photo, on: :update
	validates_attachment_content_type :photo, on: :update, content_type: ['image/jpeg', 'image/png']#/\Aimage\/.*\Z/

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
