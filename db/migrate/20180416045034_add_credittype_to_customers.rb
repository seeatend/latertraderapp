class AddCredittypeToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :credit_type, :string
  end
end
