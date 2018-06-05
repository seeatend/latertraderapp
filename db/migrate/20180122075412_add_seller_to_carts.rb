class AddSellerToCarts < ActiveRecord::Migration[5.2]
  def change
    add_reference :carts, :seller, index: true, foreign_key: true
  end
end
