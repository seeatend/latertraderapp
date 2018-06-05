class CreateClaimWastages < ActiveRecord::Migration
  def change
    create_table :claim_wastages do |t|
      t.references :stock, index: true, foreign_key: true
      t.references :employee, index: true, foreign_key: true
      t.decimal :wasted_stock_value
      t.decimal :waste_checking_labour_cost
      t.decimal :total_Waste_claim
      t.string :image

      t.timestamps null: false
    end
  end
end
