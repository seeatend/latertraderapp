json.extract! privateoffer, :id, :offer_id, :customer_id, :seller_id, :offered_price, :status, :created_at, :updated_at
json.url privateoffer_url(privateoffer, format: :json)
