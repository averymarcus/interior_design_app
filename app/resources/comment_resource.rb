class CommentResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :furniture_id, :integer
  attribute :comment, :string
  attribute :user_id, :integer

  # Direct associations

  belongs_to :furniture_post,
             resource: FurnitureResource,
             foreign_key: :furniture_id

  belongs_to :user

  # Indirect associations

end
