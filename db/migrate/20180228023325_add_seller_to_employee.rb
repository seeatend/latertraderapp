class AddSellerToEmployee < ActiveRecord::Migration[5.2]
  def change
    add_reference :employees, :seller, index: true, foreign_key: true
  end
end
