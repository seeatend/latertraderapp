class AddStuff2ToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :dropoffdateandtime, :datetime
    add_column :orders, :pickupdateandtime, :datetime
  end
end
