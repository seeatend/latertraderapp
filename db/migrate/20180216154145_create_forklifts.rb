class CreateForklifts < ActiveRecord::Migration
  def change
    create_table :forklifts do |t|
      t.references :employee, index: true, foreign_key: true
      t.string :priority
      t.references :customer, index: true, foreign_key: true
      t.references :order, index: true, foreign_key: true
      t.string :pick_up_location
      t.datetime :pick_up_date_and_time
      t.string :drop_location
      t.datetime :drop_date_and_time
      t.string :note_to_operator

      t.timestamps null: false
    end
  end
end
