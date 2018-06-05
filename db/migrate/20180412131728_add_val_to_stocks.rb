class AddValToStocks < ActiveRecord::Migration
  def change
    add_column :stocks, :approved_stock_value, :decimal
  end
end
