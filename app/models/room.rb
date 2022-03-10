class Room < ApplicationRecord
  # Direct associations

  belongs_to :home

  has_many   :furniture_items,
             :class_name => "Furniture",
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    room_name
  end

end
