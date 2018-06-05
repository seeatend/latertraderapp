require 'test_helper'

class StocksControllerTest < ActionController::TestCase
  setup do
    @stock = stocks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stocks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stock" do
    assert_difference('Stock.count') do
      post :create, stock: { buying_price: @stock.buying_price, buying_price_type: @stock.buying_price_type, grower_id: @stock.grower_id, in_stock_quantity: @stock.in_stock_quantity, physical_stock_quantity: @stock.physical_stock_quantity, physical_stock_taken_by: @stock.physical_stock_taken_by, product_id: @stock.product_id, pstb_time: @stock.pstb_time, status: @stock.status, stock_approved_by: @stock.stock_approved_by, stock_approved_time: @stock.stock_approved_time, stock_updated_by: @stock.stock_updated_by, stock_updated_time: @stock.stock_updated_time, stock_wasted_by: @stock.stock_wasted_by, stock_wasted_time: @stock.stock_wasted_time, variations: @stock.variations, wasted_stock_quantity: @stock.wasted_stock_quantity }
    end

    assert_redirected_to stock_path(assigns(:stock))
  end

  test "should show stock" do
    get :show, id: @stock
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @stock
    assert_response :success
  end

  test "should update stock" do
    patch :update, id: @stock, stock: { buying_price: @stock.buying_price, buying_price_type: @stock.buying_price_type, grower_id: @stock.grower_id, in_stock_quantity: @stock.in_stock_quantity, physical_stock_quantity: @stock.physical_stock_quantity, physical_stock_taken_by: @stock.physical_stock_taken_by, product_id: @stock.product_id, pstb_time: @stock.pstb_time, status: @stock.status, stock_approved_by: @stock.stock_approved_by, stock_approved_time: @stock.stock_approved_time, stock_updated_by: @stock.stock_updated_by, stock_updated_time: @stock.stock_updated_time, stock_wasted_by: @stock.stock_wasted_by, stock_wasted_time: @stock.stock_wasted_time, variations: @stock.variations, wasted_stock_quantity: @stock.wasted_stock_quantity }
    assert_redirected_to stock_path(assigns(:stock))
  end

  test "should destroy stock" do
    assert_difference('Stock.count', -1) do
      delete :destroy, id: @stock
    end

    assert_redirected_to stocks_path
  end
end
