class AddPaymentstuffToStocks < ActiveRecord::Migration[5.2]
  def change
    add_column :stocks, :grower_payment_status, :string
    add_column :stocks, :paid_value, :decimal
  end
end
