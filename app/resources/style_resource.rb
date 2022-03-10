class StyleResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :style_name, :string

  # Direct associations

  has_many   :rooms

  # Indirect associations

  has_many :furniture_items, resource: FurnitureResource do
    assign_each do |style, furnitures|
      furnitures.select do |f|
        f.id.in?(style.furniture_items.map(&:id))
      end
    end
  end

end
