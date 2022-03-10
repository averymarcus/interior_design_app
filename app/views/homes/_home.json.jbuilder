json.extract! home, :id, :user_id, :home_name, :home_owner, :created_at,
              :updated_at
json.url home_url(home, format: :json)
