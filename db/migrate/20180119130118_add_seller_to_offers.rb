class AddSellerToOffers < ActiveRecord::Migration[5.2]
  def change
    add_reference :offers, :seller, index: true, foreign_key: true
  end
end
