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
		
		respond_to do |format|
			if @category.save
				format.js
			else
				format.js { render 'error.js.erb' }
			end
		end
	end

	def edit
		@category = Category.find(params[:id])
		respond_to do |format|
			format.js
		end
	end

	def update
		@category = Category.find(params[:id])
		respond_to do |format|
			if @category.update(category_params)
				format.js
			else
				format.js { render 'error.js.erb' }
			end
		end
	end

	def destroy
		@category.destroy_product_images
		@category.destroy
		flash[:notice] = "Categoría borrada exitosamente."
		redirect_to products_path
	end

	private


		def find_category
			@category = Category.find(params[:id])
		end

		def category_params
			params.require(:category).permit(:name)
		end
end
