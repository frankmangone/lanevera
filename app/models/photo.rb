class Photo < ActiveRecord::Base
	before_save :randomize_file_name

	has_one :product
	
	has_attached_file :photo,
										storage: :dropbox,
										dropbox_credentials: Rails.root.join("config/dropbox.yml"),
										dropbox_visibility: 'public'

	validates_attachment_presence     :photo
	validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/

	private

	def randomize_file_name
		# See how I make this work
	end
end
