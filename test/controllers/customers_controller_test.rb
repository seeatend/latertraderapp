require 'test_helper'

class CustomersControllerTest < ActionController::TestCase
  setup do
    @customer = customers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:customers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create customer" do
    assert_difference('Customer.count') do
      post :create, customer: { abn_no: @customer.abn_no, account_name: @customer.account_name, account_number: @customer.account_number, account_type: @customer.account_type, alternative_contact_name: @customer.alternative_contact_name, alternative_mobile_number: @customer.alternative_mobile_number, alternative_title: @customer.alternative_title, approved_by: @customer.approved_by, bank_account_type: @customer.bank_account_type, bank_address: @customer.bank_address, bank_name: @customer.bank_name, billing_address: @customer.billing_address, business_legal_name: @customer.business_legal_name, business_name: @customer.business_name, buyer_email: @customer.buyer_email, buyer_type: @customer.buyer_type, certificates: @customer.certificates, code: @customer.code, fax: @customer.fax, logo_for_customer_area: @customer.logo_for_customer_area, logo_for_invoices: @customer.logo_for_invoices, market_location: @customer.market_location, member_of_smcs: @customer.member_of_smcs, mobile: @customer.mobile, office_address: @customer.office_address, office_phone: @customer.office_phone, other: @customer.other, owner: @customer.owner, owner_email: @customer.owner_email, owner_mobile_no: @customer.owner_mobile_no, owner_title: @customer.owner_title, shipping_address: @customer.shipping_address, smcs_no: @customer.smcs_no, status: @customer.status, swift_code: @customer.swift_code, tax_file_no: @customer.tax_file_no, warehouse_address: @customer.warehouse_address, web: @customer.web, wire_transfer_code: @customer.wire_transfer_code }
    end

    assert_redirected_to customer_path(assigns(:customer))
  end

  test "should show customer" do
    get :show, id: @customer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @customer
    assert_response :success
  end

  test "should update customer" do
    patch :update, id: @customer, customer: { abn_no: @customer.abn_no, account_name: @customer.account_name, account_number: @customer.account_number, account_type: @customer.account_type, alternative_contact_name: @customer.alternative_contact_name, alternative_mobile_number: @customer.alternative_mobile_number, alternative_title: @customer.alternative_title, approved_by: @customer.approved_by, bank_account_type: @customer.bank_account_type, bank_address: @customer.bank_address, bank_name: @customer.bank_name, billing_address: @customer.billing_address, business_legal_name: @customer.business_legal_name, business_name: @customer.business_name, buyer_email: @customer.buyer_email, buyer_type: @customer.buyer_type, certificates: @customer.certificates, code: @customer.code, fax: @customer.fax, logo_for_customer_area: @customer.logo_for_customer_area, logo_for_invoices: @customer.logo_for_invoices, market_location: @customer.market_location, member_of_smcs: @customer.member_of_smcs, mobile: @customer.mobile, office_address: @customer.office_address, office_phone: @customer.office_phone, other: @customer.other, owner: @customer.owner, owner_email: @customer.owner_email, owner_mobile_no: @customer.owner_mobile_no, owner_title: @customer.owner_title, shipping_address: @customer.shipping_address, smcs_no: @customer.smcs_no, status: @customer.status, swift_code: @customer.swift_code, tax_file_no: @customer.tax_file_no, warehouse_address: @customer.warehouse_address, web: @customer.web, wire_transfer_code: @customer.wire_transfer_code }
    assert_redirected_to customer_path(assigns(:customer))
  end

  test "should destroy customer" do
    assert_difference('Customer.count', -1) do
      delete :destroy, id: @customer
    end

    assert_redirected_to customers_path
  end
end
