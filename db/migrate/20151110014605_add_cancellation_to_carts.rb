class AddCancellationToCarts < ActiveRecord::Migration
  def change
    add_column :carts, :cancelled, :boolean, null: false, default: false
    add_column :carts, :cancel_reason, :string
  end
end
