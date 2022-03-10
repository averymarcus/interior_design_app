class CreateHomes < ActiveRecord::Migration[6.0]
  def change
    create_table :homes do |t|
      t.integer :user_id
      t.string :home_address
      t.string :home_image
      t.string :home_name

      t.timestamps
    end
  end
end
