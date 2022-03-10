class Home < ApplicationRecord
  mount_base64_uploader :home_image, HomeImageUploader

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
    user_id
  end

end
