class AddApproveonholdToStocks < ActiveRecord::Migration[5.2]
  def change
    add_column :stocks, :approve_on_hold_stocks, :integer
  end
end
