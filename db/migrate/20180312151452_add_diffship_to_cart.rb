class AddDiffshipToCart < ActiveRecord::Migration
  def change
    add_column :carts, :different_shipping_location, :string
  end
end
