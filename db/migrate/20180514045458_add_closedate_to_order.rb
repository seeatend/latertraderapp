class AddClosedateToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :closed_date, :datetime
  end
end
