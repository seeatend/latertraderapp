class AddStuffsToOrderedItem < ActiveRecord::Migration
  def change
    add_column :ordered_items, :consignment_number, :string
    add_column :ordered_items, :transport_contact_name, :string
    add_column :ordered_items, :transport_contact_number, :string
    add_column :ordered_items, :note_to_buyer, :string
  end
end
