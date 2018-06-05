class AddPsqToStocks < ActiveRecord::Migration[5.2]
  def change
    add_column :stocks, :purchased_stock_quantity, :decimal
  end
end
