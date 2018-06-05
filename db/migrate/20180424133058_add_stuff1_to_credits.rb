class AddStuff1ToCredits < ActiveRecord::Migration[5.2]
  def change
    add_column :credits, :requested, :decimal
    add_column :credits, :extended, :decimal
    add_column :credits, :utilised, :decimal
  end
end
