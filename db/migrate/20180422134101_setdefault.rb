class Setdefault < ActiveRecord::Migration[5.2]
  def change
  	change_column :stocks, :not_approved, :integer, default: 0
  	change_column :stocks, :offered, :integer, default: 0
  	change_column :stocks, :sold, :integer, default: 0
  	change_column :stocks, :onhold, :integer, default: 0
  end
end
