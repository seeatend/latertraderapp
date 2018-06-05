class AddStatusToEmployees < ActiveRecord::Migration[5.2]
  def change
    add_column :employees, :status, :string
  end
end
