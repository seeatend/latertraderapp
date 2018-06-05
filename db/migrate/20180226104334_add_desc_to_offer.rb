class AddDescToOffer < ActiveRecord::Migration
  def change
    add_column :offers, :desc, :string
  end
end
