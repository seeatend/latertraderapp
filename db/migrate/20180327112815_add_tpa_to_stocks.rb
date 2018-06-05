class AddTpaToStocks < ActiveRecord::Migration[5.2]
  def change
    add_column :stocks, :total_approved_stocks, :integer
  end
end
