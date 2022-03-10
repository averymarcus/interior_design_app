require "open-uri"
class Home < ApplicationRecord
  before_validation :geocode_home_address

  def geocode_home_address
    if home_address.present?
      url = "https://maps.googleapis.com/maps/api/geocode/json?key=#{ENV['GMAP_API_KEY']}&address=#{URI.encode(home_address)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.home_address_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.home_address_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.home_address_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end
  mount_base64_uploader :home_image, HomeImageUploader

  # Direct associations

  has_many   :rooms,
             dependent: :destroy

  # Indirect associations

  has_many   :furniture_items,
             through: :rooms,
             source: :furniture_items

  # Validations

  # Scopes

  def to_s
    user_id
  end
end
