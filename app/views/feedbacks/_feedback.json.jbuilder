json.extract! feedback, :id, :seller_id, :customer_id, :ratings, :message, :created_at, :updated_at
json.url feedback_url(feedback, format: :json)
