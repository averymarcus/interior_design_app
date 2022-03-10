class AddRoomReferenceToFurnitures < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :furnitures, :rooms
    add_index :furnitures, :room_id
    change_column_null :furnitures, :room_id, false
  end
end
