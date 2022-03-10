class AddFurnitureReferenceToLikes < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :likes, :furnitures
    add_index :likes, :furniture_id
    change_column_null :likes, :furniture_id, false
  end
end
