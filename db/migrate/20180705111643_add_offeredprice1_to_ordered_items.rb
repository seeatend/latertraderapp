class AddOfferedprice1ToOrderedItems < ActiveRecord::Migration
  def change
    add_column :ordered_items, :offered_price, :decimal
  end
end
