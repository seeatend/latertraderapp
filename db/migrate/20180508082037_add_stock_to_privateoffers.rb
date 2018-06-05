class AddStockToPrivateoffers < ActiveRecord::Migration[5.2]
  def change
    add_column :privateoffers, :stock_id, :integer
  end
end
