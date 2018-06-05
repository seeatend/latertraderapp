class AddValueToOrderedItems < ActiveRecord::Migration
  def change
    add_column :ordered_items, :value, :integer
  end
end
