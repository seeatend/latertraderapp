json.extract! product, :id, :name, :code, :image, :sku, :category, :quality, :size, :size_code, :order_by, :order_quantity_unit, :net_weight, :packs_per_pellets, :created_at, :updated_at
json.url product_url(product, format: :json)
