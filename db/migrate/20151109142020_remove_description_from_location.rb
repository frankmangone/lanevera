class RemoveDescriptionFromLocation < ActiveRecord::Migration
  def change
    remove_column :locations, :description, :string
  end
end
