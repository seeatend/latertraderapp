class AddOfferedpriceToCart < ActiveRecord::Migration
  def change
    add_column :carts, :offered_price, :decimal
  end
end
