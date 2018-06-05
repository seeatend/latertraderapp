class AddSellerToEmployee < ActiveRecord::Migration
  def change
    add_reference :employees, :seller, index: true, foreign_key: true
  end
end
