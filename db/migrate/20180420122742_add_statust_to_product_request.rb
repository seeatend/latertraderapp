class AddStatustToProductRequest < ActiveRecord::Migration[5.2]
  def change
    add_column :product_requests, :status, :string
  end
end
