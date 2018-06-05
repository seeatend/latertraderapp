class AddReceivedToCheps < ActiveRecord::Migration[5.2]
  def change
    add_column :cheps, :chep_received, :integer
  end
end
