class AddDescToOffer < ActiveRecord::Migration[5.2]
  def change
    add_column :offers, :desc, :string
  end
end
