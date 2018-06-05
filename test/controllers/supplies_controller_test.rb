require 'test_helper'

class SuppliesControllerTest < ActionController::TestCase
  setup do
    @supply = supplies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:supplies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create supply" do
    assert_difference('Supply.count') do
      post :create, supply: { consignment_number: @supply.consignment_number, date_received: @supply.date_received, due: @supply.due, employee_id: @supply.employee_id, grower_id: @supply.grower_id, image: @supply.image, paid: @supply.paid, ref_no: @supply.ref_no, status: @supply.status, value: @supply.value }
    end

    assert_redirected_to supply_path(assigns(:supply))
  end

  test "should show supply" do
    get :show, id: @supply
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @supply
    assert_response :success
  end

  test "should update supply" do
    patch :update, id: @supply, supply: { consignment_number: @supply.consignment_number, date_received: @supply.date_received, due: @supply.due, employee_id: @supply.employee_id, grower_id: @supply.grower_id, image: @supply.image, paid: @supply.paid, ref_no: @supply.ref_no, status: @supply.status, value: @supply.value }
    assert_redirected_to supply_path(assigns(:supply))
  end

  test "should destroy supply" do
    assert_difference('Supply.count', -1) do
      delete :destroy, id: @supply
    end

    assert_redirected_to supplies_path
  end
end
