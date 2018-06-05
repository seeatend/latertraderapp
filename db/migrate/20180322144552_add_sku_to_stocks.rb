class AddSkuToStocks < ActiveRecord::Migration
  def change
    add_column :stocks, :sku, :string
  end
end
