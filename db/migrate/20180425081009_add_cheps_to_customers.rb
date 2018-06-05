class AddChepsToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :chep_issued, :integer
    add_column :customers, :chep_due, :integer
  end
end
