class CreateHomes < ActiveRecord::Migration[6.0]
  def change
    create_table :homes do |t|
      t.integer :user_id
      t.string :home_name
      t.string :home_owner

      t.timestamps
    end
  end
end
