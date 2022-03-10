json.extract! home, :id, :user_id, :home_address, :home_image, :home_name,
              :created_at, :updated_at
json.url home_url(home, format: :json)
