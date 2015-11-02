class CategoriesController < ApplicationController

	before_action :find_category,   only: [:show, :edit, :update, :destroy]
	before_action :logged_in_admin, only: [:new, :create, :edit, :update, :destroy]

	def new
		@category = Category.new
		
		respond_to do |format|
			format.js
		end
	end

	def create
		@category = Category.new(category_params)
		@category.save
		respond_to do |format|
			format.js
		end
	end

	def edit
		
	end

	def update

	end

	def destroy
		@category.destroy_product_images
		@category.destroy
		respond_to do |format|
			format.js
		end
		
	end

	private


		def find_category
			@category = Category.find(params[:id])
		end

		def category_params
			params.require(:category).permit(:name)
		end
end
