json.extract! room, :id, :room_name, :home_id, :style_name, :created_at,
              :updated_at
json.url room_url(room, format: :json)
