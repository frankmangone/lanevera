class ProductsController < ApplicationController
	before_action :find_product, only: [:edit, :update, :show, :destroy]

	def index
		@categories = Category.all
		@category_id = params[:category_id]

		if @category_id
			@products = Category.find(@category_id).products.all
		else
			@products = Product.all
		end
	end


	def new
		@product = Product.new
		@photo = Photo.new
		@category_id = params[:category_id]

		if @category_id
			@category = Category.find(@category_id)
		else 
			@categories = Category.all
		end

		respond_to do |format|
			format.js
		end
	end


	def create
		@product = Product.new(product_params)
		
		respond_to do |format|
			if @product.save
				format.js
			else
				format.js
			end
		end
	end


	def show

	end


	def edit

	end


	def update
		respond_to do |format|
			if @product.update_attributes(product_params)
				if remotipart_submitted? 
					format.js { render 'photo.js.erb' }
				else
					format.js
				end
			else
				format.js #{ 'update_error.js.erb' }
			end
		end
	end


	def destroy
		@product.destroy
		redirect_to products_path
	end
	

	private

		def product_params
			params.require(:product).permit(:title, :price, :category_id, :photo_id)
		end

		def find_product
			@product = Product.find(params[:id])
		end
		
end
