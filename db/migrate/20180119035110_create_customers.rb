class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :business_name
      t.string :buyer_type
      t.string :code
      t.string :status
      t.string :account_type
      t.string :business_legal_name
      t.string :owner
      t.string :market_location
      t.string :owner_title
      t.string :mobile
      t.string :buyer_email
      t.string :office_phone
      t.string :owner_mobile_no
      t.string :owner_email
      t.string :alternative_contact_name
      t.string :alternative_title
      t.string :alternative_mobile_number
      t.string :fax
      t.string :web
      t.text :office_address
      t.text :shipping_address
      t.text :warehouse_address
      t.text :billing_address
      t.string :logo_for_customer_area
      t.string :logo_for_invoices
      t.string :approved_by
      t.boolean :member_of_smcs
      t.string :smcs_no
      t.string :abn_no
      t.string :tax_file_no
      t.string :other
      t.string :certificates
      t.string :bank_account_type
      t.string :bank_name
      t.string :bank_address
      t.string :account_name
      t.string :account_number
      t.string :swift_code
      t.string :wire_transfer_code

      t.timestamps null: false
    end
  end
end
