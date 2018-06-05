class AddFsdsToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :Coop_type, :string
  end
end
