class AddTypeToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :otype, :string
  end
end
