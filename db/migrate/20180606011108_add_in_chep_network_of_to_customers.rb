class AddInChepNetworkOfToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :in_chep_network_of, :string
  end
end
