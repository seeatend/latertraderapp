class CreateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
      t.references :order, index: true, foreign_key: true
      t.references :customer, index: true, foreign_key: true
      t.references :seller, index: true, foreign_key: true
      t.text :message

      t.timestamps null: false
    end
  end
end
