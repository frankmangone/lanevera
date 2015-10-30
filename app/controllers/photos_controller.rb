class PhotosController < ApplicationController

	def create
		@photo = Photo.new(photo_params)

		respond_to do |format|
			if @photo.save
				format.js
			else
				format.js { render 'create_error.js.erb' }
			end
		end
	end

	def destroy
		@photo = Photo.find(params[:id])
		@photo.destroy
		respond_to do |format|
			format.js
		end
	end

	private

	def photo_params
		params.require(:photo).permit(:photo, :photo_file_name)
	end
end