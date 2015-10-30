class StaticController < ApplicationController
	def home
		@offers = Offer.all

		# After registration, the user is sent here - that's where the cart should be created
		create_cart
	end

	private

		def create_cart
			# Generate cart if not already created
    	if current_user
    		if !current_user.cart
    			cart = current_user.build_cart
    			cart.save
    		end
    	end
		end
end
