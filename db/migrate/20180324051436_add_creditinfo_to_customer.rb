class AddCreditinfoToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :credit_utilized, :decimal
    add_column :customers, :credit_available, :decimal
    add_column :customers, :credit_due, :decimal
  end
end
