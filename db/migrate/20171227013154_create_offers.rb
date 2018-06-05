class CreateOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :offers do |t|
      t.references :stock, index: true, foreign_key: true
      t.string :sales_man
      t.string :allocated_by
      t.decimal :market_price
      t.string :selling_price_type
      t.decimal :selling_price
      t.string :quantity_type
      t.string :size_code
      t.boolean :is_taxable
      t.boolean :enable_negotitation
      t.boolean :visit_store
      t.decimal :total_quantity_on_offer
      t.decimal :min_order_quantity
      t.datetime :start_at
      t.datetime :ends_at
      t.boolean :accepts_offer_below_selling_price
      t.datetime :duration_time
      t.string :offer_type
      t.string :private_offers, array: true

      t.timestamps null: false
    end
  end
end
