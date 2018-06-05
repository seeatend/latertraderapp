class AddStuffToCheps < ActiveRecord::Migration
  def change
    add_column :cheps, :chep_type, :string
  end
end
