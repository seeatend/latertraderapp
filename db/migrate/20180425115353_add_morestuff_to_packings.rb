class AddMorestuffToPackings < ActiveRecord::Migration[5.2]
  def change
    add_column :packings, :priority, :string
    add_column :packings, :pickupdate, :datetime
    add_column :packings, :dropoffdate, :datetime
    add_column :packings, :note_to_forklift, :string
    add_column :packings, :assign_to, :string
  end
end
