class AddAssociatedToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :associated, :boolean, null: false, default: false
  end
end
