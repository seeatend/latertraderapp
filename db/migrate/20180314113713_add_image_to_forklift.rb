class AddImageToForklift < ActiveRecord::Migration
  def change
    add_column :forklifts, :image, :string
  end
end
