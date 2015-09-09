class PhotosController < ApplicationController

	def create
		@photo = Photo.new(photo_params)

		respond_to do |format|
			if @photo.save
				format.js
			else
				format.js
			end
		end
	end

	private

	def photo_params
		params.require(:photo).permit(:photo, :photo_file_name)
	end
end