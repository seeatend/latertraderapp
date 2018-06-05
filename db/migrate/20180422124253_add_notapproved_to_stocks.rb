class AddNotapprovedToStocks < ActiveRecord::Migration[5.2]
  def change
    add_column :stocks, :not_approved, :integer
  end
end
