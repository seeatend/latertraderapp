class AddSellerToSupplies < ActiveRecord::Migration
  def change
    add_reference :supplies, :seller, index: true, foreign_key: true
  end
end
