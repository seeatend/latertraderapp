class AddNoteToPackings < ActiveRecord::Migration
  def change
    add_column :packings, :note_to_packer, :string
  end
end
