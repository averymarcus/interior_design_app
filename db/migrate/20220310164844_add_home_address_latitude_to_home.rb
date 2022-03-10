class AddHomeAddressLatitudeToHome < ActiveRecord::Migration[6.0]
  def change
    add_column :homes, :home_address_latitude, :float
  end
end
