class AddHomeReferenceToRooms < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :rooms, :homes
    add_index :rooms, :home_id
    change_column_null :rooms, :home_id, false
  end
end
