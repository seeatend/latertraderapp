class AddTypeToCarts < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :otype, :string
  end
end
