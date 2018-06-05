class AddFstatusToPackings < ActiveRecord::Migration[5.2]
  def change
    add_column :packings, :idlestatus, :string
  end
end
