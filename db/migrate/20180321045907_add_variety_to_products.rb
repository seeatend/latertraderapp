class AddVarietyToProducts < ActiveRecord::Migration
  def change
    add_column :products, :variety, :string
  end
end
