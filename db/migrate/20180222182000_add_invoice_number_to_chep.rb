class AddInvoiceNumberToChep < ActiveRecord::Migration[5.2]
  def change
    add_column :cheps, :invoice_number, :string
  end
end
