class AddNoteToOffers < ActiveRecord::Migration[5.2]
  def change
    add_column :offers, :note_to_buyer, :string
  end
end
