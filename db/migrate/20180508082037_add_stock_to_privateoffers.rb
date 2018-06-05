class AddStockToPrivateoffers < ActiveRecord::Migration
  def change
    add_column :privateoffers, :stock_id, :integer
  end
end
