require 'test_helper'

class SellersControllerTest < ActionController::TestCase
  setup do
    @seller = sellers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sellers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create seller" do
    assert_difference('Seller.count') do
      post :create, seller: { abn_no: @seller.abn_no, account_name: @seller.account_name, account_number: @seller.account_number, account_type: @seller.account_type, alternative_contact_name: @seller.alternative_contact_name, alternative_mobile_number: @seller.alternative_mobile_number, alternative_title: @seller.alternative_title, approved_by: @seller.approved_by, bank_account_type: @seller.bank_account_type, bank_address: @seller.bank_address, bank_name: @seller.bank_name, billing_address: @seller.billing_address, business_legal_name: @seller.business_legal_name, business_name: @seller.business_name, certificates: @seller.certificates, code: @seller.code, fax: @seller.fax, logo_for_customer_area: @seller.logo_for_customer_area, logo_for_invoices: @seller.logo_for_invoices, market_location: @seller.market_location, member_of_smcs: @seller.member_of_smcs, mobile: @seller.mobile, office_address: @seller.office_address, office_phone: @seller.office_phone, other: @seller.other, owner: @seller.owner, owner_email: @seller.owner_email, owner_mobile_no: @seller.owner_mobile_no, owner_title: @seller.owner_title, seller_email: @seller.seller_email, seller_type: @seller.seller_type, shipping_address: @seller.shipping_address, smcs_no: @seller.smcs_no, status: @seller.status, swift_code: @seller.swift_code, tax_file_no: @seller.tax_file_no, warehouse_address: @seller.warehouse_address, web: @seller.web, wire_transfer_code: @seller.wire_transfer_code }
    end

    assert_redirected_to seller_path(assigns(:seller))
  end

  test "should show seller" do
    get :show, id: @seller
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @seller
    assert_response :success
  end

  test "should update seller" do
    patch :update, id: @seller, seller: { abn_no: @seller.abn_no, account_name: @seller.account_name, account_number: @seller.account_number, account_type: @seller.account_type, alternative_contact_name: @seller.alternative_contact_name, alternative_mobile_number: @seller.alternative_mobile_number, alternative_title: @seller.alternative_title, approved_by: @seller.approved_by, bank_account_type: @seller.bank_account_type, bank_address: @seller.bank_address, bank_name: @seller.bank_name, billing_address: @seller.billing_address, business_legal_name: @seller.business_legal_name, business_name: @seller.business_name, certificates: @seller.certificates, code: @seller.code, fax: @seller.fax, logo_for_customer_area: @seller.logo_for_customer_area, logo_for_invoices: @seller.logo_for_invoices, market_location: @seller.market_location, member_of_smcs: @seller.member_of_smcs, mobile: @seller.mobile, office_address: @seller.office_address, office_phone: @seller.office_phone, other: @seller.other, owner: @seller.owner, owner_email: @seller.owner_email, owner_mobile_no: @seller.owner_mobile_no, owner_title: @seller.owner_title, seller_email: @seller.seller_email, seller_type: @seller.seller_type, shipping_address: @seller.shipping_address, smcs_no: @seller.smcs_no, status: @seller.status, swift_code: @seller.swift_code, tax_file_no: @seller.tax_file_no, warehouse_address: @seller.warehouse_address, web: @seller.web, wire_transfer_code: @seller.wire_transfer_code }
    assert_redirected_to seller_path(assigns(:seller))
  end

  test "should destroy seller" do
    assert_difference('Seller.count', -1) do
      delete :destroy, id: @seller
    end

    assert_redirected_to sellers_path
  end
end
