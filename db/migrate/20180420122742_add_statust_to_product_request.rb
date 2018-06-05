class AddStatustToProductRequest < ActiveRecord::Migration
  def change
    add_column :product_requests, :status, :string
  end
end
