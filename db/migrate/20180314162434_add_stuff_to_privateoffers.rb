class AddStuffToPrivateoffers < ActiveRecord::Migration
  def change
    add_column :privateoffers, :quantity, :integer
  end
end
