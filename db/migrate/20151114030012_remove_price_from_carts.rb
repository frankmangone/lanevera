class RemovePriceFromCarts < ActiveRecord::Migration
  def change
    remove_column :carts, :price, :string
  end
end
