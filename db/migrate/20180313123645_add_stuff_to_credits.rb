class AddStuffToCredits < ActiveRecord::Migration[5.2]
  def change
    add_column :credits, :approved_by, :string
    add_column :credits, :note_to_buyer, :string
  end
end
