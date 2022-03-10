class Furniture < ApplicationRecord
  mount_base64_uploader :image, ImageUploader

  # Direct associations

  has_many   :likes,
             :dependent => :destroy

  has_many   :comments,
             :dependent => :destroy

  belongs_to :room

  # Indirect associations

  has_one    :home,
             :through => :room,
             :source => :home

  has_one    :design,
             :through => :room,
             :source => :design

  # Validations

  # Scopes

  def to_s
    room.to_s
  end

end
