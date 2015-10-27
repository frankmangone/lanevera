class OffersController < ApplicationController

	before_action :find_offer, only: [:edit, :update, :destroy] 

	def search
		respond_to do |format|
			format.js
		end	
	end

	def index
		@offers = Offer.all
	end

	def new
		@offer = Offer.new
	end

	def create
		
	end

	def edit

	end

	def update
		if @offer.update_attributes(offer_params)
			flash[:success] = "La oferta ha sido actualizada."
			redirect_to offers_path
		else
			render 'edit'
		end
	end

	def destroy
		@offer.destroy
		# Maybe use a Offer.count and if it's 0, don't redirect to offers?
		redirect_to offers_path
	end

	private

	def offer_params
		params.require(:offer).permit(:price)
	end

	def find_offer
		@offer = Offer.find params[:id]
	end

end
