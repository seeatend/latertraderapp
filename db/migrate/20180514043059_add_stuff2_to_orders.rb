class AddStuff2ToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :dropoffdateandtime, :datetime
    add_column :orders, :pickupdateandtime, :datetime
  end
end
