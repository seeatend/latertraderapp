class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :chat, index: true, foreign_key: true
      t.string :ctype
      t.string :content

      t.timestamps null: false
    end
  end
end
