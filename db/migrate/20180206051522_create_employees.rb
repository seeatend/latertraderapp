class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :mobile
      t.string :email
      t.string :position

      t.timestamps null: false
    end
  end
end
