class CreateSettings < ActiveRecord::Migration[5.2]
  def change
    create_table :settings do |t|

      t.timestamps null: false
    end
  end
end
