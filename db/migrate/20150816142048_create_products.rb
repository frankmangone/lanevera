class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.string :description
      t.decimal :price
      t.integer :stock
      t.belongs_to :category, index: true
      t.belongs_to :photo,    index: true

      t.timestamps null: false
    end
  end
end
