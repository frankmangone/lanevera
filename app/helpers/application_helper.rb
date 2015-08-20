module ApplicationHelper
	def fullTitle(title = '')

		base_title = "La Nevera, tu tienda de congelados"

		if title.empty?
			base_title
		else
			title + ' | ' + base_title
		end
	end
end
