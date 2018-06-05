class AddPaidamountToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :paid_amount, :integer
  end
end
