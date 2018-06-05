class AddPaymentToCart < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :payment_type, :string
    add_column :carts, :shipping_type, :string
    add_column :carts, :drop_off_point, :string
    add_column :carts, :pick_up_point, :string
    add_column :carts, :different_drop_location, :string
  end
end
