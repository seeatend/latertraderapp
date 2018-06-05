require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  setup do
    @order = orders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
      post :create, order: { consignment_number: @order.consignment_number, customer_id: @order.customer_id, invoice_number: @order.invoice_number, item_received_by_number: @order.item_received_by_number, item_received_date: @order.item_received_date, item_recevied_by_name: @order.item_recevied_by_name, item_shipped_date: @order.item_shipped_date, items: @order.items, note_to_buyer: @order.note_to_buyer, note_to_seller: @order.note_to_seller, o_status: @order.o_status, order_approved_date: @order.order_approved_date, payment_confirmed_by: @order.payment_confirmed_by, payment_done_date: @order.payment_done_date, seller_id: @order.seller_id, shipping_address: @order.shipping_address, total_due: @order.total_due, transport_contact_name: @order.transport_contact_name, transport_contact_number: @order.transport_contact_number }
    end

    assert_redirected_to order_path(assigns(:order))
  end

  test "should show order" do
    get :show, id: @order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @order
    assert_response :success
  end

  test "should update order" do
    patch :update, id: @order, order: { consignment_number: @order.consignment_number, customer_id: @order.customer_id, invoice_number: @order.invoice_number, item_received_by_number: @order.item_received_by_number, item_received_date: @order.item_received_date, item_recevied_by_name: @order.item_recevied_by_name, item_shipped_date: @order.item_shipped_date, items: @order.items, note_to_buyer: @order.note_to_buyer, note_to_seller: @order.note_to_seller, o_status: @order.o_status, order_approved_date: @order.order_approved_date, payment_confirmed_by: @order.payment_confirmed_by, payment_done_date: @order.payment_done_date, seller_id: @order.seller_id, shipping_address: @order.shipping_address, total_due: @order.total_due, transport_contact_name: @order.transport_contact_name, transport_contact_number: @order.transport_contact_number }
    assert_redirected_to order_path(assigns(:order))
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete :destroy, id: @order
    end

    assert_redirected_to orders_path
  end
end
