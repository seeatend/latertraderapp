require 'test_helper'

class NotificationsControllerTest < ActionController::TestCase
  setup do
    @notification = notifications(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:notifications)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create notification" do
    assert_difference('Notification.count') do
      post :create, notification: { chat_id: @notification.chat_id, content: @notification.content, customer_id: @notification.customer_id, ntype: @notification.ntype, offer_id: @notification.offer_id, order_id: @notification.order_id, product_id: @notification.product_id, seller_id: @notification.seller_id, stock_id: @notification.stock_id }
    end

    assert_redirected_to notification_path(assigns(:notification))
  end

  test "should show notification" do
    get :show, id: @notification
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @notification
    assert_response :success
  end

  test "should update notification" do
    patch :update, id: @notification, notification: { chat_id: @notification.chat_id, content: @notification.content, customer_id: @notification.customer_id, ntype: @notification.ntype, offer_id: @notification.offer_id, order_id: @notification.order_id, product_id: @notification.product_id, seller_id: @notification.seller_id, stock_id: @notification.stock_id }
    assert_redirected_to notification_path(assigns(:notification))
  end

  test "should destroy notification" do
    assert_difference('Notification.count', -1) do
      delete :destroy, id: @notification
    end

    assert_redirected_to notifications_path
  end
end
