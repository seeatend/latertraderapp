class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.references :product, index: true, foreign_key: true
      t.references :grower, index: true, foreign_key: true
      t.string :status
      t.decimal :buying_price
      t.string :buying_price_type
      t.decimal :in_stock_quantity
      t.decimal :physical_stock_quantity
      t.decimal :variations
      t.decimal :wasted_stock_quantity
      t.string :stock_updated_by
      t.datetime :stock_updated_time
      t.string :stock_approved_by
      t.datetime :stock_approved_time
      t.string :physical_stock_taken_by
      t.datetime :pstb_time
      t.string :stock_wasted_by
      t.datetime :stock_wasted_time

      t.timestamps null: false
    end
  end
end
