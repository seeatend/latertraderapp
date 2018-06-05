json.extract! forklift, :id, :employee_id, :priority, :customer_id, :order_id, :pick_up_location, :pick_up_date_and_time, :drop_location, :drop_date_and_time, :note_to_operator, :created_at, :updated_at
json.url forklift_url(forklift, format: :json)
