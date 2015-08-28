class UsersController < ApplicationController

	before_action :find_user, only: [:show, :edit, :update, :destroy]

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
	end

	def edit
		
	end

	def update
		
	end

	def show
		
	end

	def index
		@users = User.all
	end

	def destroy
		
	end

	private

		def find_user
			@user = User.find(params[:id])
		end

		def user_params
			params.require(:user).permit(:first_name, :last_name)
		end
end

