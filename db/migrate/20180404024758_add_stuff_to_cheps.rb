class AddStuffToCheps < ActiveRecord::Migration[5.2]
  def change
    add_column :cheps, :chep_type, :string
  end
end
