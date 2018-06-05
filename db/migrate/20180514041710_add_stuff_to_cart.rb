class AddStuffToCart < ActiveRecord::Migration
  def change

    add_column :carts, :dropoffdateandtime, :datetime
    add_column :carts, :pickupdateandtime, :datetime
  end
end
