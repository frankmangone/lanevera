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
		@category.save
		respond_to do |format|
			format.js
		end
	end

	def show
		#@products = @category.products.all
	end

	def destroy
		@category.destroy_product_images
		@category.destroy
		respond_to do |format|
			format.js
		end
		
	end

	# Returns name of requested id
	def find
		@category = Category.find(params[:id])

		respond_to do |format|
			if @name
				format.json {}
			else

			end
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
