class AddSellerToOffers < ActiveRecord::Migration
  def change
    add_reference :offers, :seller, index: true, foreign_key: true
  end
end
