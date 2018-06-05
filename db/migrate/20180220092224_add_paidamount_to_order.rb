class AddPaidamountToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :paid_amount, :integer
  end
end
