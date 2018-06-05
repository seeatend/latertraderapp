class AddDescToStock < ActiveRecord::Migration
  def change
    add_column :stocks, :desc, :string
  end
end
