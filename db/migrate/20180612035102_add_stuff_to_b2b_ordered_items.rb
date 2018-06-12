class AddStuffToB2bOrderedItems < ActiveRecord::Migration
  def change
    add_column :b2b_ordered_items, :consignment_number, :string
    add_column :b2b_ordered_items, :transport_contact_number, :string
    add_column :b2b_ordered_items, :transport_contact_name, :string
    add_column :b2b_ordered_items, :note_to_buyer, :string
    add_column :b2b_ordered_items, :paid_amount, :integer
    add_column :b2b_ordered_items, :payment_done_date, :datetime
    add_column :b2b_ordered_items, :payment_confirmed_by, :string
  end
end
