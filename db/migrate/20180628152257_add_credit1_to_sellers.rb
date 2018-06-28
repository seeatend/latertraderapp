class AddCredit1ToSellers < ActiveRecord::Migration
  def change
    add_column :sellers, :credit_limit, :decimal
    add_column :sellers, :in_network_of, :integer
    add_column :sellers, :credit_utilized, :decimal
    add_column :sellers, :credit_available, :decimal
    add_column :sellers, :credit_due, :decimal
    add_column :sellers, :credit_type, :string
    add_column :sellers, :Coop_type, :string
    add_column :sellers, :Coop_ref_no, :string
    add_column :sellers, :credit_terms, :string
    add_column :sellers, :coop_credit, :boolean
    add_column :sellers, :coop_credit_limit, :decimal
    add_column :sellers, :coop_credit_utilized, :decimal
    add_column :sellers, :coop_credit_available, :decimal
    add_column :sellers, :coop_credit_due, :decimal
    add_column :sellers, :chep_issued, :integer
    add_column :sellers, :chep_due, :integer
    add_column :sellers, :chep_received, :integer
    add_column :sellers, :in_chep_network_of, :string
  end
end
