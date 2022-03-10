class FurnitureResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :room_id, :integer
  attribute :image, :string

  # Direct associations

  has_many   :comments

  belongs_to :room

  # Indirect associations

end
