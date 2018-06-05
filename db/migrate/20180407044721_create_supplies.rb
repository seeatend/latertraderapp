class CreateSupplies < ActiveRecord::Migration[5.2]
  def change
    create_table :supplies do |t|
      t.references :grower, index: true, foreign_key: true
      t.string :consignment_number
      t.datetime :date_received
      t.string :ref_no
      t.decimal :value
      t.decimal :paid
      t.decimal :due
      t.string :status
      t.string :image
      t.references :employee, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
