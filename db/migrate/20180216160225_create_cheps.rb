class CreateCheps < ActiveRecord::Migration
  def change
    create_table :cheps do |t|
      t.references :customer, index: true, foreign_key: true
      t.references :order, index: true, foreign_key: true
      t.datetime :delivery_date
      t.integer :chep_issued
      t.integer :chep_due

      t.timestamps null: false
    end
  end
end
