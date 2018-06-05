class AddStuffToPrivateoffers < ActiveRecord::Migration[5.2]
  def change
    add_column :privateoffers, :quantity, :integer
  end
end
