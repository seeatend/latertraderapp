class AddFsds2ToCustomer < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :credit_terms, :string
  end
end
