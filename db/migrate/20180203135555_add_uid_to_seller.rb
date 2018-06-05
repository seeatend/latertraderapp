class AddUidToSeller < ActiveRecord::Migration
  def change
    add_column :sellers, :uid, :integer
  end
end
