json.extract! invite, :id, :name, :email, :mobile, :business_number, :created_at, :updated_at
json.url invite_url(invite, format: :json)
