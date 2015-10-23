class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.decimal :price

      t.timestamps null: false
    end
  end
end
