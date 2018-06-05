class AddReceivedToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :chep_received, :integer
  end
end
