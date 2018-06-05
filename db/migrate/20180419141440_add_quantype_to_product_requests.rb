class AddQuantypeToProductRequests < ActiveRecord::Migration
  def change
    add_column :product_requests, :quantity_type, :string
  end
end
