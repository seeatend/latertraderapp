class AddNoteToCart < ActiveRecord::Migration
  def change
    add_column :carts, :note_to_seller, :string
  end
end
