class AddStuffToCart < ActiveRecord::Migration[5.2]
  def change

    add_column :carts, :dropoffdateandtime, :datetime
    add_column :carts, :pickupdateandtime, :datetime
  end
end
