class AddStuffToPackings < ActiveRecord::Migration
  def change
    add_column :packings, :pallet_type, :string
    add_column :packings, :chep_issued, :integer
    add_column :packings, :chep_due, :integer
  end
end
