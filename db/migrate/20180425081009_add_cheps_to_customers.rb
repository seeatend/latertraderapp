class AddChepsToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :chep_issued, :integer
    add_column :customers, :chep_due, :integer
  end
end
