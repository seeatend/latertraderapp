require 'test_helper'

class ClaimWastagesControllerTest < ActionController::TestCase
  setup do
    @claim_wastage = claim_wastages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:claim_wastages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create claim_wastage" do
    assert_difference('ClaimWastage.count') do
      post :create, claim_wastage: { employee_id: @claim_wastage.employee_id, image: @claim_wastage.image, stock_id: @claim_wastage.stock_id, total_Waste_claim: @claim_wastage.total_Waste_claim, waste_checking_labour_cost: @claim_wastage.waste_checking_labour_cost, wasted_stock_value: @claim_wastage.wasted_stock_value }
    end

    assert_redirected_to claim_wastage_path(assigns(:claim_wastage))
  end

  test "should show claim_wastage" do
    get :show, id: @claim_wastage
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @claim_wastage
    assert_response :success
  end

  test "should update claim_wastage" do
    patch :update, id: @claim_wastage, claim_wastage: { employee_id: @claim_wastage.employee_id, image: @claim_wastage.image, stock_id: @claim_wastage.stock_id, total_Waste_claim: @claim_wastage.total_Waste_claim, waste_checking_labour_cost: @claim_wastage.waste_checking_labour_cost, wasted_stock_value: @claim_wastage.wasted_stock_value }
    assert_redirected_to claim_wastage_path(assigns(:claim_wastage))
  end

  test "should destroy claim_wastage" do
    assert_difference('ClaimWastage.count', -1) do
      delete :destroy, id: @claim_wastage
    end

    assert_redirected_to claim_wastages_path
  end
end
