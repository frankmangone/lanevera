class UsersController < ApplicationController

	before_action :find_user,       only: :show
	before_action :owner_or_admin,  only: [:show, :edit, :update, :destroy]
	before_action :logged_in_admin, only: [:admin, :index]

	def show
		@round_rating = @user.round_rating
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

		def owner_or_admin
			unless current_user_admin? || current_user?(params[:id])
				flash[:error] = "No tienes permiso para realizar esa acción."
				redirect_to products_path
			end
		end

end

