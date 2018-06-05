class AddCustomerToProductRequests < ActiveRecord::Migration[5.2]
  def change
    add_reference :product_requests, :customer, index: true, foreign_key: true
  end
end
