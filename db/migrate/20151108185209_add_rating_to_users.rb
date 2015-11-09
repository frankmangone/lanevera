class AddRatingToUsers < ActiveRecord::Migration
  def change
    add_column :users, :rating_average, :decimal, null: false, default: 0
    add_column :users, :rating_amount,  :integer, null: false, default: 0
  end
end
