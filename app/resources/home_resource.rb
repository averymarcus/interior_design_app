class HomeResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :user_id, :integer
  attribute :home_address, :string
  attribute :home_image, :string

  # Direct associations

  has_many   :rooms

  # Indirect associations

end
