class AddBsbToSellers < ActiveRecord::Migration
  def change
    add_column :sellers, :BSB, :string
  end
end
