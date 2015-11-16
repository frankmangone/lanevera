class Product < ActiveRecord::Base
	belongs_to :category
	belongs_to :photo, dependent: :destroy
	has_one    :offer, dependent: :destroy
	has_many   :items, dependent: :destroy

	validates :title,       presence: true
	validates :category_id, presence: true
	validates :price,       presence: true, numericality: { greater_than: 0 }
	validates :photo_id,    presence: true

	scope :search, lambda { |search|
		if search != "" && search
			# This is unsafe due to SQL exploits, see how to fix
			where("lower(title) LIKE ?", "%#{search.downcase}%")
			# where("lower(title) LIKE ?", search.downcase) <- should work in pg
		else
			all
		end
	}

	def write_price
		"$" +	price.to_s
	end

end
