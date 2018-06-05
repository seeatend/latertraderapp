class Addquantitytoordereditems < ActiveRecord::Migration
  def change
  	 add_column :ordered_items, :quantity, :integer
  end
end
