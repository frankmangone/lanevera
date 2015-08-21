class ProductsController < ApplicationController
	before_action :find_product, only: [:edit, :update, :show, :destroy]

	def index
		@categories = Category.all
		@category_names = serve_category_names(@categories)

		@category_id = params[:category_id]

		if @category_id
			@products = Category.find(@category_id).products.all
		else
			@products = Product.all
		end
	end


	def new
		@product = Product.new
		@category_id = params[:category_id]

		if @category_id
			@category = Category.find(@category_id)
		else 
			@categories = Category.all
		end

		# Later, if a category is selected, add it directly to that category.
		respond_to do |format|
			format.js
		end
	end


	def create
		@product = Product.create(product_params)
		@product.category_name = Category.find(@product.category_id).name

		respond_to do |format|
			if @product.save
				format.json { render json: @product, status: :ok }
			else
				format.json { render json: @product.errors, status: :unprocessable_entity }
			end
		end
	end


	def show

	end


	def edit

	end


	def update

	end


	def destroy
		
	end
	

	private

		def product_params
			params.require(:product).permit(:title, :category_id)#, :description, :price, :stock)
		end

		def find_product
			@product = Product.find(params[:id])
		end

		# Create a hash that relates category ids with theis names.
		def serve_category_names(categories)
			serve = {}

			categories.each do |c|
				serve["name"+c.id.to_s] = c.name
			end

			serve
		end
		
end
