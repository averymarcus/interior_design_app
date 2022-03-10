class RoomResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :room_name, :string
  attribute :home_id, :integer
  attribute :style_id, :integer

  # Direct associations

  belongs_to :home

  has_many   :furniture_items,
             resource: FurnitureResource

  # Indirect associations

end
