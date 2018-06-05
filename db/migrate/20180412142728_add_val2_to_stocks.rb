class AddVal2ToStocks < ActiveRecord::Migration[5.2]
  def change
    add_column :stocks, :osqval, :decimal
    add_column :stocks, :soldval, :decimal
    add_column :stocks, :isqval, :decimal
  end
end
