class AddCountriesToGrower < ActiveRecord::Migration
  def change
    add_column :growers, :country, :string
    add_column :growers, :state, :string
    add_column :growers, :city, :string
    add_column :growers, :zip, :string
  end
end
