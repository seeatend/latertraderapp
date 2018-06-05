class AddOnholdstuffToStocks < ActiveRecord::Migration
  def change
    add_column :stocks, :onhold, :integer
    add_column :stocks, :sold, :integer
    add_column :stocks, :offered, :integer
  end
end
