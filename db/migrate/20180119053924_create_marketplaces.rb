class CreateMarketplaces < ActiveRecord::Migration[5.2]
  def change
    create_table :marketplaces do |t|

      t.timestamps null: false
    end
  end
end
