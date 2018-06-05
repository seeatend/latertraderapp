class AddSellerToSupplies < ActiveRecord::Migration[5.2]
  def change
    add_reference :supplies, :seller, index: true, foreign_key: true
  end
end
