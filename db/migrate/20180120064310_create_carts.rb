class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.references :customer, index: true, foreign_key: true
      t.references :offer, index: true, foreign_key: true
      t.boolean :o_status

      t.timestamps null: false
    end
  end
end
