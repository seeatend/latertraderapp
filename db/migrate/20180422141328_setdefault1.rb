class Setdefault1 < ActiveRecord::Migration[5.2]
  def change
  		change_column :stocks, :total_approved_stocks, :integer, default: 0
  end
end
