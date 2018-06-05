class CreatePrivateoffers < ActiveRecord::Migration
  def change
    create_table :privateoffers do |t|
      t.references :offer, index: true, foreign_key: true
      t.references :customer, index: true, foreign_key: true
      t.references :seller, index: true, foreign_key: true
      t.decimal :offered_price
      t.string :status

      t.timestamps null: false
    end
  end
end
