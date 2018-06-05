require 'test_helper'

class GrowersControllerTest < ActionController::TestCase
  setup do
    @grower = growers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:growers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create grower" do
    assert_difference('Grower.count') do
      post :create, grower: { address: @grower.address, balance: @grower.balance, certificates: @grower.certificates, company: @grower.company, growers_email_id: @grower.growers_email_id, mobile_number: @grower.mobile_number, name: @grower.name, order_to_date: @grower.order_to_date, smcs_member: @grower.smcs_member, status: @grower.status, telephone_number: @grower.telephone_number, zip_code: @grower.zip_code }
    end

    assert_redirected_to grower_path(assigns(:grower))
  end

  test "should show grower" do
    get :show, id: @grower
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @grower
    assert_response :success
  end

  test "should update grower" do
    patch :update, id: @grower, grower: { address: @grower.address, balance: @grower.balance, certificates: @grower.certificates, company: @grower.company, growers_email_id: @grower.growers_email_id, mobile_number: @grower.mobile_number, name: @grower.name, order_to_date: @grower.order_to_date, smcs_member: @grower.smcs_member, status: @grower.status, telephone_number: @grower.telephone_number, zip_code: @grower.zip_code }
    assert_redirected_to grower_path(assigns(:grower))
  end

  test "should destroy grower" do
    assert_difference('Grower.count', -1) do
      delete :destroy, id: @grower
    end

    assert_redirected_to growers_path
  end
end
