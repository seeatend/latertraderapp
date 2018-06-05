class AddMarketlocationToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :market_drop_off_location, :string
  end
end
