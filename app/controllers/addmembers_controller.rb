class AddmembersController < ApplicationController
  def index
  	@customer = Customer.new
  end
  def add_to_network

  	@customer = Customer.find(params[:customer][:id])
  	if params[:customer][:credit_type] == "Seller Credit"
  	@customer.update_column(:credit_type, params[:customer][:credit_type])
  	@customer.update_column(:Coop_type, params[:customer][:Coop_type])
  	@customer.update_column(:Coop_ref_no, params[:customer][:Coop_ref_no])
  	@customer.update_column(:credit_terms, params[:customer][:credit_terms])
  	@customer.update_column(:credit_limit, params[:customer][:credit_limit])
  	@customer.update_column(:credit_utilized, params[:customer][:credit_utilized])
  	@customer.update_column(:credit_available, params[:customer][:credit_available])
  	@customer.update_column(:credit_due, params[:customer][:credit_due])
  	@customer.update_column(:in_network_of, params[:customer][:in_network_of])
  else 
    @customer.update_column(:credit_type, params[:customer][:credit_type])
    @customer.update_column(:Coop_type, params[:customer][:Coop_type])
    @customer.update_column(:Coop_ref_no, params[:customer][:Coop_ref_no])
    @customer.update_column(:coop_credit, true)
    @customer.update_column(:credit_terms, params[:customer][:credit_terms])
    @customer.update_column(:coop_credit_limit, params[:customer][:credit_limit])
    @customer.update_column(:coop_credit_utilized, params[:customer][:credit_utilized])
    @customer.update_column(:coop_credit_available, params[:customer][:credit_available])
    @customer.update_column(:coop_credit_due, params[:customer][:credit_due])
    @customer.update_column(:in_network_of, params[:customer][:in_network_of])
  end 

  	redirect_to credits_path
  end
end
