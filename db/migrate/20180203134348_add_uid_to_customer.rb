class AddUidToCustomer < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :uid, :integer
  end
end
