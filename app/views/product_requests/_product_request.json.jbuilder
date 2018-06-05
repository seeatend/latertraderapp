json.extract! product_request, :id, :seller_id, :product_id, :required_quantity, :required_date, :note, :created_at, :updated_at
json.url product_request_url(product_request, format: :json)
