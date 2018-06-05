json.extract! grower, :id, :name, :address, :mobile_number, :telephone_number, :growers_email_id, :certificates, :company, :zip_code, :smcs_member, :balance, :order_to_date, :status, :created_at, :updated_at
json.url grower_url(grower, format: :json)
