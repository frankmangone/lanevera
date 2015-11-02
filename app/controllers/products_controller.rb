class ProductsController < ApplicationController

	before_action :find_product,      only: [:edit, :update, :show, :destroy]
	before_action :select_categories, only: [:index, :new, :edit]
	before_action :logged_in_admin,   only: [:new, :create, :edit, :update, :destroy]

	def index
		@products   = Category.search(params[:category_id], params[:search])
	end


	def new
		@product = Product.new
		@photo   = unassociated_photo
	end


	def create
		@product = Product.new(product_params)

		respond_to do |format|
			if @product.save
				# Update Photo associated attribute
				Photo.find(product_params[:photo_id]).update(associated: true)
				format.js
			else
				format.js
			end
		end
	end


	def edit
		if !@product.photo
			@photo = unassociated_photo
		else
			# If the Product already has a Photo
			@photo = @product.photo
		end
	end


	def update
		
		respond_to do |format|
			if @product.update_attributes(product_params)
				Photo.find(product_params[:photo_id]).update(associated: true)
				format.js
			else
				format.js
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

		# Select categories
		def select_categories
			@categories = Category.all
		end

		# Returns unassociated photo if any, or a new one.
		def unassociated_photo
			photo = Photo.where(associated: false).first
			# the "first" is there because the selection returns an array,
			# even though it contains a single element

			if !photo
				photo = Photo.new
			end

			photo
		end
		
end
