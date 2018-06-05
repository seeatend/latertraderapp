class CreateSlabs < ActiveRecord::Migration
  def change
    create_table :slabs do |t|
      t.references :offer, index: true, foreign_key: true
      t.integer :from_quantity
      t.integer :to_quantity
      t.decimal :value

      t.timestamps null: false
    end
  end
end
