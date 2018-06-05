class AddStuff1ToSellers < ActiveRecord::Migration
  def change
    add_column :sellers, :market_drop_off_location, :string
  end
end
