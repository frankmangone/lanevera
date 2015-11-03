class ChangeReceivedToDelivered < ActiveRecord::Migration
  def change
  	rename_column :carts, :received, :delivered
  end
end
