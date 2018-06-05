class AddTpaToStocks < ActiveRecord::Migration
  def change
    add_column :stocks, :total_approved_stocks, :integer
  end
end
