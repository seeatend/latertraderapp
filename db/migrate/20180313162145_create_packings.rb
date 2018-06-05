class CreatePackings < ActiveRecord::Migration
  def change
    create_table :packings do |t|
      t.references :employee, index: true, foreign_key: true
      t.references :order, index: true, foreign_key: true
      t.string :status

      t.timestamps null: false
    end
  end
end
