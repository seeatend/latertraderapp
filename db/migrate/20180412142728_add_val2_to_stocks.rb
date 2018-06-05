class AddVal2ToStocks < ActiveRecord::Migration
  def change
    add_column :stocks, :osqval, :decimal
    add_column :stocks, :soldval, :decimal
    add_column :stocks, :isqval, :decimal
  end
end
