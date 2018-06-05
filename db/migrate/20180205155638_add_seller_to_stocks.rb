class AddSellerToStocks < ActiveRecord::Migration
  def change
    add_reference :stocks, :seller, index: true, foreign_key: true
  end
end
