class AddPincodeToSellers < ActiveRecord::Migration
  def change
    add_column :sellers, :pincode, :string
  end
end
