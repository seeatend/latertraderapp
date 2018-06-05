class AddStuff1ToSellers < ActiveRecord::Migration[5.2]
  def change
    add_column :sellers, :market_drop_off_location, :string
  end
end
