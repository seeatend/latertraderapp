class CreateB2bOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :b2b_orders do |t|
      t.references :seller, index: true, foreign_key: true
      t.string :o_status
      t.string :shipping_address
      t.string :total_due
      t.string :invoice_number
      t.integer :poi_id
      t.datetime :item_shipped_date
      t.string :consignment_number
      t.string :transport_contact_name
      t.string :transport_contact_number
      t.string :item_received_by
      t.string :item_received_by_number
      t.datetime :payment_done_date
      t.datetime :payment_confirmed_date
      t.string :note_to_buyer
      t.integer :quantity
      t.integer :paid_amount
      t.string :payment_type
      t.string :shipping_type
      t.string :drop_off_point
      t.string :pick_up_point
      t.string :different_drop_location
      t.string :different_shipping_location
      t.string :packing_done
      t.string :packing_done_by
      t.string :otype

      t.timestamps null: false
    end
  end
end
