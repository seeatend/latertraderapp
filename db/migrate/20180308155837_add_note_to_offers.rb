class AddNoteToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :note_to_buyer, :string
  end
end
