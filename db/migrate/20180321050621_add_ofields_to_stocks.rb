class AddOfieldsToStocks < ActiveRecord::Migration
  def change
    add_column :stocks, :date_received, :datetime
    add_column :stocks, :ref_no, :string
  end
end
