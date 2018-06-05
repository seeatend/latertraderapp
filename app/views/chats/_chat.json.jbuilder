json.extract! chat, :id, :order_id, :customer_id, :seller_id, :message, :created_at, :updated_at
json.url chat_url(chat, format: :json)
