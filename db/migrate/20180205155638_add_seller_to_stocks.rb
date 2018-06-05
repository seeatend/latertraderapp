class AddSellerToStocks < ActiveRecord::Migration[5.2]
  def change
    add_reference :stocks, :seller, index: true, foreign_key: true
  end
end
