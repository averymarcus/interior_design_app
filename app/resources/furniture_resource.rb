class FurnitureResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :room_id, :integer
  attribute :image, :string
  attribute :furniture_name, :string

  # Direct associations

  belongs_to :room

  # Indirect associations

  has_one    :home

  filter :home_id, :integer do
    eq do |scope, value|
      scope.eager_load(:home).where(rooms: { home_id: value })
    end
  end
end
