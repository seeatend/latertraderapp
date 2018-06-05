class AddImageToStocks < ActiveRecord::Migration[5.2]
  def change
    add_column :stocks, :consignment_image, :string
    add_column :stocks, :consignment_number, :string
  end
end
