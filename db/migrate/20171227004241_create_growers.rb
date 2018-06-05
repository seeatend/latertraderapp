class CreateGrowers < ActiveRecord::Migration
  def change
    create_table :growers do |t|
      t.string :name
      t.string :address
      t.string :mobile_number
      t.string :telephone_number
      t.string :growers_email_id
      t.string :certificates
      t.string :company
      t.string :zip_code
      t.boolean :smcs_member
      t.decimal :balance
      t.decimal :order_to_date
      t.string :status

      t.timestamps null: false
    end
  end
end
