class AddChepyToForklift < ActiveRecord::Migration
  def change
    add_column :forklifts, :chep_issued, :integer
    add_column :forklifts, :chep_due, :integer
  end
end
