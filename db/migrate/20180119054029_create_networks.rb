class CreateNetworks < ActiveRecord::Migration[5.2]
  def change
    create_table :networks do |t|

      t.timestamps null: false
    end
  end
end
