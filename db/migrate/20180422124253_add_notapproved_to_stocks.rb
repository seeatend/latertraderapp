class AddNotapprovedToStocks < ActiveRecord::Migration
  def change
    add_column :stocks, :not_approved, :integer
  end
end
