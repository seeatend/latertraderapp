require 'test_helper'

class ProductRequestsControllerTest < ActionController::TestCase
  setup do
    @product_request = product_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:product_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product_request" do
    assert_difference('ProductRequest.count') do
      post :create, product_request: { note: @product_request.note, product_id: @product_request.product_id, required_date: @product_request.required_date, required_quantity: @product_request.required_quantity, seller_id: @product_request.seller_id }
    end

    assert_redirected_to product_request_path(assigns(:product_request))
  end

  test "should show product_request" do
    get :show, id: @product_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product_request
    assert_response :success
  end

  test "should update product_request" do
    patch :update, id: @product_request, product_request: { note: @product_request.note, product_id: @product_request.product_id, required_date: @product_request.required_date, required_quantity: @product_request.required_quantity, seller_id: @product_request.seller_id }
    assert_redirected_to product_request_path(assigns(:product_request))
  end

  test "should destroy product_request" do
    assert_difference('ProductRequest.count', -1) do
      delete :destroy, id: @product_request
    end

    assert_redirected_to product_requests_path
  end
end
