class AddRatingToCarts < ActiveRecord::Migration
  def change
    add_column :carts, :rating, :integer, null: false, default: 3
  end
end
