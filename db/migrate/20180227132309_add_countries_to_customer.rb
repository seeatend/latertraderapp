class AddCountriesToCustomer < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :country, :string
    add_column :customers, :state, :string
    add_column :customers, :city, :string
    add_column :customers, :zip, :string
  end
end
