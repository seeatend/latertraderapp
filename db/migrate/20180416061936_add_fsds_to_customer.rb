class AddFsdsToCustomer < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :Coop_type, :string
  end
end
