class AddCreditlimitToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :credit_limit, :decimal
  end
end
