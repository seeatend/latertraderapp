class AddQuantypeToProductRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :product_requests, :quantity_type, :string
  end
end
