class AddCountriesToSeller < ActiveRecord::Migration
  def change
    add_column :sellers, :country, :string
    add_column :sellers, :state, :string
    add_column :sellers, :city, :string
    add_column :sellers, :zip, :string
  end
end
