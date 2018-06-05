class CreateCredits < ActiveRecord::Migration
  def change
    create_table :credits do |t|
      t.references :order, index: true, foreign_key: true
      t.decimal :value
      t.string :ctype
      t.string :status
      t.references :employee, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
