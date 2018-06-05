class AddFstatusToPackings < ActiveRecord::Migration
  def change
    add_column :packings, :idlestatus, :string
  end
end
