class AddImageToForklift < ActiveRecord::Migration[5.2]
  def change
    add_column :forklifts, :image, :string
  end
end
