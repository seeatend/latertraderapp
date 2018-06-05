class AddInvoiceToForklift < ActiveRecord::Migration
  def change
    add_column :forklifts, :invoice, :string
  end
end
