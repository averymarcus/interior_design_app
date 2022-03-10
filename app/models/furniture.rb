class Furniture < ApplicationRecord
  # Direct associations

  has_many   :comments,
             :dependent => :destroy

  belongs_to :room

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    room.to_s
  end

end
