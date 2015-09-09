class Photo < ActiveRecord::Base
	has_one :product
	
	has_attached_file :photo,
										storage: :dropbox,
										dropbox_credentials: Rails.root.join("config/dropbox.yml"),
										dropbox_visibility: 'public'

	validates_attachment_presence     :photo
	validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
end
