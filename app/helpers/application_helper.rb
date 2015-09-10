module ApplicationHelper
	def full_title(title = '')

		base_title = "La Nevera, tu tienda de congelados"

		if title.empty?
			base_title
		else
			title + ' | ' + base_title
		end
	end

	def current_user_admin?
		if !current_user
			false
		else
			current_user.admin?
		end
	end
end
