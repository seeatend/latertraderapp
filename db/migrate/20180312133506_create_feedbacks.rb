class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.references :seller, index: true, foreign_key: true
      t.references :customer, index: true, foreign_key: true
      t.decimal :ratings
      t.text :message

      t.timestamps null: false
    end
  end
end
