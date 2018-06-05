class AddReceivedToForklifts < ActiveRecord::Migration[5.2]
  def change
    add_column :forklifts, :chep_received, :integer
  end
end
