class Furniture < ApplicationRecord
  mount_base64_uploader :image, ImageUploader

  # Direct associations

  belongs_to :room

  # Indirect associations

  has_one    :home,
             through: :room,
             source: :home

  # Validations

  # Scopes

  def to_s
    room.to_s
  end
end
