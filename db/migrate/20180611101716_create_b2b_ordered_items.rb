class CreateB2bOrderedItems < ActiveRecord::Migration
  def change
    create_table :b2b_ordered_items do |t|
      t.references :b2b_order, index: true, foreign_key: true
      t.references :seller, index: true, foreign_key: true
      t.integer :poi_id
      t.references :offer, index: true, foreign_key: true
      t.integer :quantity
      t.integer :value
      t.string :o_status

      t.timestamps null: false
    end
  end
end
