class AddTypeToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :otype, :string
  end
end
