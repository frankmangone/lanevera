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
				# Add info for rendering
				partial = { partial: render_to_string(@category) }
				@category = JSON::parse(@category.to_json).merge( partial ).to_json

				format.json { render json: @category, status: :ok }
			else
				format.json { render json: @category.errors, status: :unprocessable_entity }
			end
		end
	end

	def show
		#@products = @category.products.all
	end

	def destroy
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
