class AddPoiidToProductRequests < ActiveRecord::Migration
  def change
    add_column :product_requests, :poi_id, :integer
  end
end
