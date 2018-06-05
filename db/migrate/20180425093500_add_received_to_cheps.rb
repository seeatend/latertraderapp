class AddReceivedToCheps < ActiveRecord::Migration
  def change
    add_column :cheps, :chep_received, :integer
  end
end
