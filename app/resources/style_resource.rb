class StyleResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :style_name, :string

  # Direct associations

  has_many   :rooms

  # Indirect associations

end
