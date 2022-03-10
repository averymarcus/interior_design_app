class AddHomeAddressLongitudeToHome < ActiveRecord::Migration[6.0]
  def change
    add_column :homes, :home_address_longitude, :float
  end
end
