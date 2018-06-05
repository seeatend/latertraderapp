class AddCreditlimitToCustomer < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :credit_limit, :decimal
  end
end
