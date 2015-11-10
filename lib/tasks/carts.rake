namespace :carts do
	desc "Delete delivered carts 3 hours aprox. after the delivery"

	task delete_delivered_carts: :environment do
		Cart.where(delivered: true).each do |cart|
			time_from_update = Time.now - cart.updated_at
			if time_from_update > 3.hours
				# Sum rating to user (later on)
				cart.destroy
			end
		end	
	end

	task.delete_cancelled_carts: :environment do
		Cart.where(cancelled: true).each do |cart|
			time_from_update = Time.now - cart.updated_at
			if time_from_update > 3.hours
				cart.destroy
			end
		end
	end
end
