json.extract! missing_item, :id, :name, :description, :region, :city, :is_missing, :user_id, :created_at, :updated_at
json.url missing_item_url(missing_item, format: :json)
