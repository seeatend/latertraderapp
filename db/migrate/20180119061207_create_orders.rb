class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :customer, index: true, foreign_key: true
      t.references :seller, index: true, foreign_key: true
      t.string :items, array: true
      t.datetime :order_approved_date
      t.text :shipping_address
      t.string :o_status
      t.decimal :total_due
      t.string :invoice_number
      t.datetime :item_shipped_date
      t.string :consignment_number
      t.string :transport_contact_name
      t.string :transport_contact_number
      t.datetime :item_received_date
      t.string :item_recevied_by_name
      t.string :item_received_by_number
      t.datetime :payment_done_date
      t.string :payment_confirmed_by
      t.string :note_to_buyer
      t.string :note_to_seller

      t.timestamps null: false
    end
  end
end
