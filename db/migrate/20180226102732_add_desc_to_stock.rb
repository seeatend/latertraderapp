class AddDescToStock < ActiveRecord::Migration[5.2]
  def change
    add_column :stocks, :desc, :string
  end
end
