class AddStatusToOrderedItem < ActiveRecord::Migration
  def change
    add_column :ordered_items, :o_status, :string
  end
end
