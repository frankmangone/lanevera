class Cart < ActiveRecord::Base

	has_many   :items, dependent: :destroy
	belongs_to :user

	# Checks if a certain user is the owner of the cart
	def owner?(user)
		user.id == self.user.id
	end

end
