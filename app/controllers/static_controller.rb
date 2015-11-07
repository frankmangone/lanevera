class StaticController < ApplicationController
	def home
		@offers = Offer.all
	end

	def info

	end

	def contact

	end
end
