class Style < ApplicationRecord
  # Direct associations

  has_many   :rooms,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    style_name
  end

end
