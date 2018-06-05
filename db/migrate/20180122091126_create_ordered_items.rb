class CreateOrderedItems < ActiveRecord::Migration[5.2]
  def change
    create_table :ordered_items do |t|
      t.references :order, index: true, foreign_key: true
      t.references :customer, index: true, foreign_key: true
      t.references :seller, index: true, foreign_key: true
      t.references :offer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
