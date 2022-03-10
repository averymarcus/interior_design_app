class AddFurniturePostReferenceToComments < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :comments, :furnitures
    add_index :comments, :furniture_id
    change_column_null :comments, :furniture_id, false
  end
end
