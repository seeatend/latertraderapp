class AddStuffoneToStocks < ActiveRecord::Migration
  def change
    add_reference :stocks, :supply, index: true, foreign_key: true
  end
end
