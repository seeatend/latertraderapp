class AddReceivedToForklifts < ActiveRecord::Migration
  def change
    add_column :forklifts, :chep_received, :integer
  end
end
