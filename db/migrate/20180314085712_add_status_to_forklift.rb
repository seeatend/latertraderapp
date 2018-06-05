class AddStatusToForklift < ActiveRecord::Migration[5.2]
  def change
    add_column :forklifts, :status, :string
  end
end
