class AddValueToStocks < ActiveRecord::Migration
  def change
    add_column :stocks, :stockvalue, :decimal
  end
end
