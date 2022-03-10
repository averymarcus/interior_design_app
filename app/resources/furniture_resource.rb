class FurnitureResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :room_id, :integer
  attribute :image, :string

  # Direct associations

  has_many   :likes

  has_many   :comments

  belongs_to :room

  # Indirect associations

  has_one    :home
  has_one    :design,
             resource: StyleResource

  filter :style_id, :integer do
    eq do |scope, value|
      scope.eager_load(:design).where(:rooms => {:style_id => value})
    end
  end

  filter :home_id, :integer do
    eq do |scope, value|
      scope.eager_load(:home).where(:rooms => {:home_id => value})
    end
  end
end
