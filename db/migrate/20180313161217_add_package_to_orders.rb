class AddPackageToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :packing_done, :string
    add_column :orders, :packing_done_by, :string
  end
end
