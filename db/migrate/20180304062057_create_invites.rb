class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.string :name
      t.string :email
      t.string :mobile
      t.string :business_number

      t.timestamps null: false
    end
  end
end
