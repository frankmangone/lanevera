module ApplicationHelper
	def full_title(title = '')

		base_title = "La Nevera, tu tienda de congelados"

		if title.empty?
			base_title
		else
			title + ' | ' + base_title
		end
	end

	# Checks if logged user is an admin
	def current_user_admin?
		if !current_user
			false
		else
			current_user.admin?
		end
	end

	# Checks if id belongs to current user
	def current_user?(id)
		user = User.find(id)
		user == current_user
	end

	# Write value as price
	def monetize(value)
		"$ #{value}"	
	end
end
