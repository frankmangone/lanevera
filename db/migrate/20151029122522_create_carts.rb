class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.boolean :confirmed, null: false, default: false
      t.boolean :received,  null: false, default: false
      t.decimal :price,     null: false, default: 0

      t.timestamps null: false
    end
  end
end
