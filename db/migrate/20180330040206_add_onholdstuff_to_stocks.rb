class AddOnholdstuffToStocks < ActiveRecord::Migration[5.2]
  def change
    add_column :stocks, :onhold, :integer
    add_column :stocks, :sold, :integer
    add_column :stocks, :offered, :integer
  end
end
