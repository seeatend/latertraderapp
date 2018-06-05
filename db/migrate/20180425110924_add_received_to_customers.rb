class AddReceivedToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :chep_received, :integer
  end
end
