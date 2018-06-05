class AddFsds2ToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :credit_terms, :string
  end
end
