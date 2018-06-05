class AddPackageToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :packing_done, :string
    add_column :orders, :packing_done_by, :string
  end
end
