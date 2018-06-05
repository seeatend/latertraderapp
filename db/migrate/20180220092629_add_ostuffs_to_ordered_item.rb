class AddOstuffsToOrderedItem < ActiveRecord::Migration
  def change
    add_column :ordered_items, :paid_amount, :integer
    add_column :ordered_items, :payment_done_date, :datetime
  end
end
