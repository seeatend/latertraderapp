class AddCreditstuff1ToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :coop_credit, :boolean
    add_column :customers, :coop_credit_limit, :decimal
    add_column :customers, :coop_credit_utilized, :decimal
    add_column :customers, :coop_credit_available, :decimal
    add_column :customers, :coop_credit_due, :decimal
  end
end
