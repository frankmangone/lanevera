class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :product_id
      t.integer :amount, null: false, default: 0

      t.timestamps null: false
    end
  end
end
