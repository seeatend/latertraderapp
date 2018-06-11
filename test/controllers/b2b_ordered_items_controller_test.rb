require 'test_helper'

class B2bOrderedItemsControllerTest < ActionController::TestCase
  setup do
    @b2b_ordered_item = b2b_ordered_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:b2b_ordered_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create b2b_ordered_item" do
    assert_difference('B2bOrderedItem.count') do
      post :create, b2b_ordered_item: { b2b_order_id: @b2b_ordered_item.b2b_order_id, o_status: @b2b_ordered_item.o_status, offer_id: @b2b_ordered_item.offer_id, poi_id: @b2b_ordered_item.poi_id, quantity: @b2b_ordered_item.quantity, seller_id: @b2b_ordered_item.seller_id, value: @b2b_ordered_item.value }
    end

    assert_redirected_to b2b_ordered_item_path(assigns(:b2b_ordered_item))
  end

  test "should show b2b_ordered_item" do
    get :show, id: @b2b_ordered_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @b2b_ordered_item
    assert_response :success
  end

  test "should update b2b_ordered_item" do
    patch :update, id: @b2b_ordered_item, b2b_ordered_item: { b2b_order_id: @b2b_ordered_item.b2b_order_id, o_status: @b2b_ordered_item.o_status, offer_id: @b2b_ordered_item.offer_id, poi_id: @b2b_ordered_item.poi_id, quantity: @b2b_ordered_item.quantity, seller_id: @b2b_ordered_item.seller_id, value: @b2b_ordered_item.value }
    assert_redirected_to b2b_ordered_item_path(assigns(:b2b_ordered_item))
  end

  test "should destroy b2b_ordered_item" do
    assert_difference('B2bOrderedItem.count', -1) do
      delete :destroy, id: @b2b_ordered_item
    end

    assert_redirected_to b2b_ordered_items_path
  end
end
