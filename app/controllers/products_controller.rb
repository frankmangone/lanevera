class ProductsController < ApplicationController
	before_action :find_product, only: [:edit, :update, :show, :destroy]

	def index
		@categories = Category.all
		@products = Category.search(params[:category_id], params[:search])
	end


	def new
		@product = Product.new
		@photo   = Photo.new
		# TODO for some reason, :category_id in params is nil... 
		@categories = Category.filter(params[:category_id])

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
