class AddNoteToPackings < ActiveRecord::Migration[5.2]
  def change
    add_column :packings, :note_to_packer, :string
  end
end
