class AddInnetworkofToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :in_network_of, :integer
  end
end
