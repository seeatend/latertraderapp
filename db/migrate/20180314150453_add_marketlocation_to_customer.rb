class AddMarketlocationToCustomer < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :market_drop_off_location, :string
  end
end
