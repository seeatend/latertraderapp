class AddStatesToCustomer < ActiveRecord::Migration
  def change
  
    add_column :customers, :hometown, :string
    
    add_column :customers, :pincode, :string
  end
end
