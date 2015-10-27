class StaticController < ApplicationController
	def home
		@offers = Offer.all
	end
end
