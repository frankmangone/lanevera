namespace :carts do
	desc "Manage carts every 30 minutes"

	task delete_delivered_carts: :environment do
		Cart.where(delivered: true).each do |cart|
			time_from_update = Time.now - cart.updated_at
			if time_from_update > 3.hours
				# Sum rating to user
				previous_average = cart.user.rating_average
				previous_amount  = cart.user.rating_amount

				new_average = (previous_amount*previous_average + cart.rating)/(previous_amount + 1)
				cart.user.update rating_average: new_average, rating_amount: (previous_amount + 1)
				
				cart.destroy
			end
		end	
	end

	task delete_cancelled_carts: :environment do
		Cart.where(cancelled: true).each do |cart|
			time_from_update = Time.now - cart.updated_at
			if time_from_update > 3.hours
				cart.destroy
			end
		end
	end
end