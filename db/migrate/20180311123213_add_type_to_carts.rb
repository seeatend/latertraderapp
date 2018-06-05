class AddTypeToCarts < ActiveRecord::Migration
  def change
    add_column :carts, :otype, :string
  end
end
