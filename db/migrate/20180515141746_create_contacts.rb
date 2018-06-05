class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :mobile
      t.string :email
      t.string :picture

      t.timestamps null: false
    end
  end
end
