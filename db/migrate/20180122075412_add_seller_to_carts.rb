class AddSellerToCarts < ActiveRecord::Migration
  def change
    add_reference :carts, :seller, index: true, foreign_key: true
  end
end
