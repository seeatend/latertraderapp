class BuyerStepsController < ApplicationController
	include Wicked::Wizard
	steps :addresses, :bankinfo, :approval

	  def show
	  	@customer= Customer.find(session[:customer_id])
    render_wizard
  end

  def update
  @customer = Customer.find(session[:customer_id])
   @customer.update(customer_params)
  
  render_wizard @customer
end

def finish_wizard_path
 networks_path
end

private

def customer_params
    params.require(:customer).permit(:business_name, :buyer_type, :code, :status, :account_type, :business_legal_name, :owner, :market_location, :owner_title, :mobile, :buyer_email, :office_phone, :owner_mobile_no, :owner_email, :alternative_contact_name, :alternative_title, :alternative_mobile_number, :fax, :web, :office_address, :shipping_address, :warehouse_address, :billing_address, :logo_for_customer_area, :logo_for_invoices, :approved_by, :member_of_smcs, :smcs_no, :abn_no, :tax_file_no, :other, :certificates, :bank_account_type, :bank_name, :bank_address, :account_name, :account_number, :swift_code, :wire_transfer_code,:uid,:market_drop_off_location,:in_network_of,:credit_limit,:credit_utilized,:credit_available,:credit_due,:credit_type,:Coop_type,:Coop_ref_no,:credit_terms)
    end
end
