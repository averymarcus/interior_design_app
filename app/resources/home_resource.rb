class HomeResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :user_id, :integer
  attribute :home_address, :string
  attribute :home_image, :string
  attribute :home_name, :string

  # Direct associations

  has_many :rooms

  # Indirect associations

  has_many :furniture_items, resource: FurnitureResource do
    assign_each do |home, furnitures|
      furnitures.select do |f|
        f.id.in?(home.furniture_items.map(&:id))
      end
    end
  end
end
