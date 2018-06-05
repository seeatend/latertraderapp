class AddCustomerToProductRequests < ActiveRecord::Migration
  def change
    add_reference :product_requests, :customer, index: true, foreign_key: true
  end
end
