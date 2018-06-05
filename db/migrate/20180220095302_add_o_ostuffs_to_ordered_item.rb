class AddOOstuffsToOrderedItem < ActiveRecord::Migration[5.2]
  def change
    add_column :ordered_items, :payment_confirmed_by, :string
  end
end
