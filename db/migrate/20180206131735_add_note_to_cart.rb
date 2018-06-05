class AddNoteToCart < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :note_to_seller, :string
  end
end
