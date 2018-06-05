class AddSkuToStocks < ActiveRecord::Migration[5.2]
  def change
    add_column :stocks, :sku, :string
  end
end
