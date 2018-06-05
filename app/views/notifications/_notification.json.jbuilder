json.extract! notification, :id, :customer_id, :seller_id, :order_id, :offer_id, :stock_id, :product_id, :chat_id, :content, :ntype, :created_at, :updated_at
json.url notification_url(notification, format: :json)
