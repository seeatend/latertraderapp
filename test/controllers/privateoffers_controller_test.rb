require 'test_helper'

class PrivateoffersControllerTest < ActionController::TestCase
  setup do
    @privateoffer = privateoffers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:privateoffers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create privateoffer" do
    assert_difference('Privateoffer.count') do
      post :create, privateoffer: { customer_id: @privateoffer.customer_id, offer_id: @privateoffer.offer_id, offered_price: @privateoffer.offered_price, seller_id: @privateoffer.seller_id, status: @privateoffer.status }
    end

    assert_redirected_to privateoffer_path(assigns(:privateoffer))
  end

  test "should show privateoffer" do
    get :show, id: @privateoffer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @privateoffer
    assert_response :success
  end

  test "should update privateoffer" do
    patch :update, id: @privateoffer, privateoffer: { customer_id: @privateoffer.customer_id, offer_id: @privateoffer.offer_id, offered_price: @privateoffer.offered_price, seller_id: @privateoffer.seller_id, status: @privateoffer.status }
    assert_redirected_to privateoffer_path(assigns(:privateoffer))
  end

  test "should destroy privateoffer" do
    assert_difference('Privateoffer.count', -1) do
      delete :destroy, id: @privateoffer
    end

    assert_redirected_to privateoffers_path
  end
end
