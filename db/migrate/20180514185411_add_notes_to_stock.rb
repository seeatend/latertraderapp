class AddNotesToStock < ActiveRecord::Migration[5.2]
  def change
    add_column :stocks, :note, :string
  end
end
