class CreateProductRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :product_requests do |t|
      t.references :seller, index: true, foreign_key: true
      t.references :product, index: true, foreign_key: true
      t.string :required_quantity
      t.datetime :required_date
      t.string :note

      t.timestamps null: false
    end
  end
end
