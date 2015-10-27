class OffersController < ApplicationController

	before_action :find_offer, only: [:edit, :update, :destroy] 

	def index
		@offers = Offer.all
	end

	def new
		@product = Product.find(params[:product_id])
		@offer = @product.build_offer
	end

	def create
		@offer = Offer.new offer_params
		respond_to do |format|
			if @offer.save
				format.js
			else
				format.js
			end
		end
	end

	def edit

	end

	def update
		respond_to do |format|
			if @offer.update_attributes(offer_params)
				format.js
			else
				format.js
			end
		end
	end

	def destroy
		@offer.destroy
		# Maybe use a Offer.count and if it's 0, don't redirect to offers?
		redirect_to offers_path
	end

	private

	def offer_params
		params.require(:offer).permit(:price, :product_id)
	end

	def find_offer
		@offer = Offer.find params[:id]
	end

end
