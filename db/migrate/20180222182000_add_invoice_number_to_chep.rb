class AddInvoiceNumberToChep < ActiveRecord::Migration
  def change
    add_column :cheps, :invoice_number, :string
  end
end
