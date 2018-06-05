class AddValueToOrderedItems < ActiveRecord::Migration[5.2]
  def change
    add_column :ordered_items, :value, :integer
  end
end
