class ProductsController < ApplicationController
	before_action :find_product,      only: [:edit, :update, :show, :destroy]
	before_action :select_categories, only: [:index, :new, :edit]
	before_action :logged_in_admin,   only: [:new, :create, :edit, :update, :destroy]

	def index
		@products   = Category.search(params[:category_id], params[:search])
	end


	def new
		@product    = Product.new
		last_photo = Photo.last

		# Check the status of the last photo
		if last_photo.product
			# If it already has a product associated, generate a new Photo
			@photo = Photo.new
		else
			# If not, force it on the new Product form
			@photo = last_photo
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


	def edit
		if !@product.photo
			# If the Product doesn't have a Photo, there are two scenarios:
			last_photo = Photo.last
			if last_photo.product
				@photo = Photo.new
			else
				@photo = last_photo
			end
		else
			# If the Product already has a Photo
			@photo = @product.photo
		end
	end


	def update
		@product.update_attributes(product_params)
			
		respond_to do |format|
			format.js
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

		# Checks if there exists a logged in admin
		def logged_in_admin
			unless current_user_admin?
				flash[:error] = "No tienes permiso para realizar esa acción."
				redirect_to products_path
			end
		end
		
end
