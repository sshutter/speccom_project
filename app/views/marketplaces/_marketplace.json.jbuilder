json.extract! marketplace, :id, :user_id, :item_id, :price, :stock, :created_at, :updated_at
json.url marketplace_url(marketplace, format: :json)
