class AddFsds1ToCustomer < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :Coop_ref_no, :string
  end
end
