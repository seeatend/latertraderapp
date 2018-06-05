require 'test_helper'

class MarketplacesControllerTest < ActionController::TestCase
  setup do
    @marketplace = marketplaces(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:marketplaces)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create marketplace" do
    assert_difference('Marketplace.count') do
      post :create, marketplace: {  }
    end

    assert_redirected_to marketplace_path(assigns(:marketplace))
  end

  test "should show marketplace" do
    get :show, id: @marketplace
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @marketplace
    assert_response :success
  end

  test "should update marketplace" do
    patch :update, id: @marketplace, marketplace: {  }
    assert_redirected_to marketplace_path(assigns(:marketplace))
  end

  test "should destroy marketplace" do
    assert_difference('Marketplace.count', -1) do
      delete :destroy, id: @marketplace
    end

    assert_redirected_to marketplaces_path
  end
end
