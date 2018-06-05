class AddClosedateToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :closed_date, :datetime
  end
end
