class AddCustomertypeToCredits < ActiveRecord::Migration
  def change
    add_column :credits, :customer_type, :string
  end
end
