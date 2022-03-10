class Style < ApplicationRecord
  # Direct associations

  has_many   :rooms,
             :dependent => :destroy

  # Indirect associations

  has_many   :furniture_items,
             :through => :rooms,
             :source => :furniture_items

  # Validations

  # Scopes

  def to_s
    style_name
  end

end
