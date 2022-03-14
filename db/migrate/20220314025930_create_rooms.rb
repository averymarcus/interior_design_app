class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :room_name
      t.integer :home_id
      t.integer :style_id
      t.string :style_name

      t.timestamps
    end
  end
end
