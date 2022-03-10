class AddDesignReferenceToRooms < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :rooms, :styles
    add_index :rooms, :style_id
    change_column_null :rooms, :style_id, false
  end
end
