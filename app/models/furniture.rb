class Furniture < ApplicationRecord
  # Direct associations

  has_many   :likes,
             :dependent => :destroy

  has_many   :comments,
             :dependent => :destroy

  belongs_to :room

  # Indirect associations

  has_one    :design,
             :through => :room,
             :source => :design

  # Validations

  # Scopes

  def to_s
    room.to_s
  end

end
