class AddStuffToCredits < ActiveRecord::Migration
  def change
    add_column :credits, :approved_by, :string
    add_column :credits, :note_to_buyer, :string
  end
end
