class AddStatusToForklift < ActiveRecord::Migration
  def change
    add_column :forklifts, :status, :string
  end
end
