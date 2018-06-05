class AddThingsToStock < ActiveRecord::Migration
  def change
    add_column :stocks, :order_by, :string
    add_column :stocks, :order_quantity_unit, :string
    add_column :stocks, :net_weight, :string
    add_column :stocks, :packs_per_pellets, :string
  end
end
