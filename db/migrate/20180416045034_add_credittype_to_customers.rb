class AddCredittypeToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :credit_type, :string
  end
end
