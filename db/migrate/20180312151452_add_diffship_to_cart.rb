class AddDiffshipToCart < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :different_shipping_location, :string
  end
end
