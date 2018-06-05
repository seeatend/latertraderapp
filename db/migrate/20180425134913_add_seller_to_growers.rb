class AddSellerToGrowers < ActiveRecord::Migration[5.2]
  def change
    add_reference :growers, :seller, index: true, foreign_key: true
  end
end
