class AddStuffToOrders < ActiveRecord::Migration
  def change
    
    add_column :orders, :shipping_type, :string
    add_column :orders, :drop_off_point, :string
    add_column :orders, :pick_up_point, :string
    add_column :orders, :different_drop_location, :string
    add_column :orders, :different_shipping_location, :string
  end
end
