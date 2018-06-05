class AddFsds1ToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :Coop_ref_no, :string
  end
end
