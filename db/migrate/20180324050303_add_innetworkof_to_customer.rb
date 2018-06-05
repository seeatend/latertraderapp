class AddInnetworkofToCustomer < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :in_network_of, :integer
  end
end
