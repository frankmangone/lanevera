class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.decimal :latitude
      t.decimal :longitude
      t.integer :user_id
      t.string :description

      t.timestamps null: false
    end
  end
end
