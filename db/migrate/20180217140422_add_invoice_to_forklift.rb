class AddInvoiceToForklift < ActiveRecord::Migration[5.2]
  def change
    add_column :forklifts, :invoice, :string
  end
end
