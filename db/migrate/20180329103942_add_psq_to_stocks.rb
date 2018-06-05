class AddPsqToStocks < ActiveRecord::Migration
  def change
    add_column :stocks, :purchased_stock_quantity, :decimal
  end
end
