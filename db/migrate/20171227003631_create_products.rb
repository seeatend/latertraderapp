class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :code
      t.string :image
      t.string :sku
      t.string :category
      t.string :quality
      t.string :size
      t.string :size_code
      t.string :order_by
      t.string :order_quantity_unit
      t.decimal :net_weight
      t.decimal :packs_per_pellets

      t.timestamps null: false
    end
  end
end
