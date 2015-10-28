class UsersController < ApplicationController

	before_action :find_user, only: :show

	def show
		
	end

	def index
		@users = User.all
	end

	private

		def find_user
			@user = User.find(params[:id])
		end

		def user_params
			params.require(:user).permit(:first_name, :last_name, location_attributes: [:id, :latitude, :longitude])
		end
end

