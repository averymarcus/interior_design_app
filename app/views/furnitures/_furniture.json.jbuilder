json.extract! furniture, :id, :room_id, :image, :furniture_name, :created_at,
              :updated_at
json.url furniture_url(furniture, format: :json)
