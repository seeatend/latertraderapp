class AddOrderdateToB2bOrders < ActiveRecord::Migration
  def change
    add_column :b2b_orders, :order_approved_date, :datetime
  end
end
