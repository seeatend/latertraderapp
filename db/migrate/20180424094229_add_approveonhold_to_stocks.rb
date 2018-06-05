class AddApproveonholdToStocks < ActiveRecord::Migration
  def change
    add_column :stocks, :approve_on_hold_stocks, :integer
  end
end
