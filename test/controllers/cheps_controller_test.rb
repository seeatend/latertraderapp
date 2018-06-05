require 'test_helper'

class ChepsControllerTest < ActionController::TestCase
  setup do
    @chep = cheps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cheps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create chep" do
    assert_difference('Chep.count') do
      post :create, chep: { chep_due: @chep.chep_due, chep_issued: @chep.chep_issued, customer_id: @chep.customer_id, delivery_date: @chep.delivery_date, order_id: @chep.order_id }
    end

    assert_redirected_to chep_path(assigns(:chep))
  end

  test "should show chep" do
    get :show, id: @chep
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @chep
    assert_response :success
  end

  test "should update chep" do
    patch :update, id: @chep, chep: { chep_due: @chep.chep_due, chep_issued: @chep.chep_issued, customer_id: @chep.customer_id, delivery_date: @chep.delivery_date, order_id: @chep.order_id }
    assert_redirected_to chep_path(assigns(:chep))
  end

  test "should destroy chep" do
    assert_difference('Chep.count', -1) do
      delete :destroy, id: @chep
    end

    assert_redirected_to cheps_path
  end
end
