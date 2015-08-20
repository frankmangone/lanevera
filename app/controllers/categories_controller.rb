class CategoriesController < ApplicationController
	before_action :find_category, only: [:show, :destroy]

	def index
		@categories = Category.all
	end

	def new
		@category = Category.new
		respond_to do |format|
			format.js
		end
	end

	def create
		@category = Category.new(category_params)

		respond_to do |format|
			if @category.save
				format.json { render json: @category }
			else
				format.json { render json: @category.errors.full_messages, status: :unprocessable_entity }
			end
		end
	end

	def show
		@products = @category.products.all
	end

	def destroy
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
