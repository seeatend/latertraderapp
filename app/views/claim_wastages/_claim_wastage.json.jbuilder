json.extract! claim_wastage, :id, :stock_id, :employee_id, :wasted_stock_value, :waste_checking_labour_cost, :total_Waste_claim, :image, :created_at, :updated_at
json.url claim_wastage_url(claim_wastage, format: :json)
