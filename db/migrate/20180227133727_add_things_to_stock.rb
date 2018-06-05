class AddThingsToStock < ActiveRecord::Migration[5.2]
  def change
    add_column :stocks, :order_by, :string
    add_column :stocks, :order_quantity_unit, :string
    add_column :stocks, :net_weight, :string
    add_column :stocks, :packs_per_pellets, :string
  end
end
