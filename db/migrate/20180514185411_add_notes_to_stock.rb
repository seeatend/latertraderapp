class AddNotesToStock < ActiveRecord::Migration
  def change
    add_column :stocks, :note, :string
  end
end
