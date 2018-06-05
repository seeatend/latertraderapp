class AddSellerToGrowers < ActiveRecord::Migration
  def change
    add_reference :growers, :seller, index: true, foreign_key: true
  end
end
