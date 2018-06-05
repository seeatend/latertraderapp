class AddOOstuffsToOrderedItem < ActiveRecord::Migration
  def change
    add_column :ordered_items, :payment_confirmed_by, :string
  end
end
