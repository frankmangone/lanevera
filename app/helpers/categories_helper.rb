module CategoriesHelper

	def list_categories_for_select(categories)
		data = Array.new

		categories.each do |category|
			data << [category.name, category.id]
		end

		data
	end

end
