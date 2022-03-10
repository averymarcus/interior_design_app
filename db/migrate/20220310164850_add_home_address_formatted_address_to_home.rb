class AddHomeAddressFormattedAddressToHome < ActiveRecord::Migration[6.0]
  def change
    add_column :homes, :home_address_formatted_address, :string
  end
end
