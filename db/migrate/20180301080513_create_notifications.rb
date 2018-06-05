class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.references :customer, index: true, foreign_key: true
      t.references :seller, index: true, foreign_key: true
      t.references :order, index: true, foreign_key: true
      t.references :offer, index: true, foreign_key: true
      t.references :stock, index: true, foreign_key: true
      t.references :product, index: true, foreign_key: true
      t.references :chat, index: true, foreign_key: true
      t.string :content
      t.string :ntype

      t.timestamps null: false
    end
  end
end
