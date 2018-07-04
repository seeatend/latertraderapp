class AddStatesToSellers < ActiveRecord::Migration
  def change
    add_column :sellers, :hometown, :string
  end
end
