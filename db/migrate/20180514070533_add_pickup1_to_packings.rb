class AddPickup1ToPackings < ActiveRecord::Migration
  def change
    add_column :packings, :pick_up_point, :string
    add_column :packings, :drop_off_point, :string
  end
end
