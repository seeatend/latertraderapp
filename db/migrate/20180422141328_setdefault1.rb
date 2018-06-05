class Setdefault1 < ActiveRecord::Migration
  def change
  		change_column :stocks, :total_approved_stocks, :integer, default: 0
  end
end
