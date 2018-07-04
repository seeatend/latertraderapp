class SellerStepsController < ApplicationController
	include Wicked::Wizard
	steps :addresses, :bankinfo, :approval

	  def show
	  	@seller = Seller.find(session[:seller_id])
    render_wizard
  end

  def update
  @seller = Seller.find(session[:seller_id])
   @seller.update(seller_params)
  
  render_wizard @seller
end
def finish_wizard_path
 networks_path(:ntype => "seller")
end

private

def seller_params
      params.require(:seller).permit(:business_name, :seller_type, :code, :status, :account_type, :business_legal_name, :owner, :market_location, :owner_title, :mobile, :seller_email, :office_phone, :owner_mobile_no, :owner_email, :alternative_contact_name, :alternative_title, :alternative_mobile_number, :fax, :web, :office_address, :shipping_address, :warehouse_address, :billing_address, :logo_for_customer_area, :logo_for_invoices, :approved_by, :member_of_smcs, :smcs_no, :abn_no, :tax_file_no, :other, :certificates, :bank_account_type, :bank_name, :bank_address, :account_name, :account_number, :swift_code, :wire_transfer_code,:uid,:market_drop_off_location,:in_network_of,:credit_limit,:credit_utilized,:credit_available,:credit_due,:credit_type,:Coop_type,:Coop_ref_no,:credit_terms,:coop_credit,:coop_credit_limit,:coop_credit_utilized,:coop_credit_available,:coop_credit_due,:chep_issued,:chep_due,:chep_received,:in_chep_network_of,:pincode,:state,:country,:hometown)
    end
end
