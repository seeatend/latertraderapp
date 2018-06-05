class AddValToStocks < ActiveRecord::Migration[5.2]
  def change
    add_column :stocks, :approved_stock_value, :decimal
  end
end
