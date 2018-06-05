class AddValueToStocks < ActiveRecord::Migration[5.2]
  def change
    add_column :stocks, :stockvalue, :decimal
  end
end
