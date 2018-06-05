class AddPoiidToProductRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :product_requests, :poi_id, :integer
  end
end
