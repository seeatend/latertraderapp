class AddStatusToOrderedItem < ActiveRecord::Migration[5.2]
  def change
    add_column :ordered_items, :o_status, :string
  end
end
