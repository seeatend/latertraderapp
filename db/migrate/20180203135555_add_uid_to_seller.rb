class AddUidToSeller < ActiveRecord::Migration[5.2]
  def change
    add_column :sellers, :uid, :integer
  end
end
