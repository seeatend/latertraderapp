require 'test_helper'

class B2bOrdersControllerTest < ActionController::TestCase
  setup do
    @b2b_order = b2b_orders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:b2b_orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create b2b_order" do
    assert_difference('B2bOrder.count') do
      post :create, b2b_order: { consignment_number: @b2b_order.consignment_number, different_drop_location: @b2b_order.different_drop_location, different_shipping_location: @b2b_order.different_shipping_location, drop_off_point: @b2b_order.drop_off_point, invoice_number: @b2b_order.invoice_number, item_received_by: @b2b_order.item_received_by, item_received_by_number: @b2b_order.item_received_by_number, item_shipped_date: @b2b_order.item_shipped_date, note_to_buyer: @b2b_order.note_to_buyer, o_status: @b2b_order.o_status, otype: @b2b_order.otype, packing_done: @b2b_order.packing_done, packing_done_by: @b2b_order.packing_done_by, paid_amount: @b2b_order.paid_amount, payment_confirmed_date: @b2b_order.payment_confirmed_date, payment_done_date: @b2b_order.payment_done_date, payment_type: @b2b_order.payment_type, pick_up_point: @b2b_order.pick_up_point, poi_id: @b2b_order.poi_id, quantity: @b2b_order.quantity, seller_id: @b2b_order.seller_id, shipping_address: @b2b_order.shipping_address, shipping_type: @b2b_order.shipping_type, total_due: @b2b_order.total_due, transport_contact_name: @b2b_order.transport_contact_name, transport_contact_number: @b2b_order.transport_contact_number }
    end

    assert_redirected_to b2b_order_path(assigns(:b2b_order))
  end

  test "should show b2b_order" do
    get :show, id: @b2b_order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @b2b_order
    assert_response :success
  end

  test "should update b2b_order" do
    patch :update, id: @b2b_order, b2b_order: { consignment_number: @b2b_order.consignment_number, different_drop_location: @b2b_order.different_drop_location, different_shipping_location: @b2b_order.different_shipping_location, drop_off_point: @b2b_order.drop_off_point, invoice_number: @b2b_order.invoice_number, item_received_by: @b2b_order.item_received_by, item_received_by_number: @b2b_order.item_received_by_number, item_shipped_date: @b2b_order.item_shipped_date, note_to_buyer: @b2b_order.note_to_buyer, o_status: @b2b_order.o_status, otype: @b2b_order.otype, packing_done: @b2b_order.packing_done, packing_done_by: @b2b_order.packing_done_by, paid_amount: @b2b_order.paid_amount, payment_confirmed_date: @b2b_order.payment_confirmed_date, payment_done_date: @b2b_order.payment_done_date, payment_type: @b2b_order.payment_type, pick_up_point: @b2b_order.pick_up_point, poi_id: @b2b_order.poi_id, quantity: @b2b_order.quantity, seller_id: @b2b_order.seller_id, shipping_address: @b2b_order.shipping_address, shipping_type: @b2b_order.shipping_type, total_due: @b2b_order.total_due, transport_contact_name: @b2b_order.transport_contact_name, transport_contact_number: @b2b_order.transport_contact_number }
    assert_redirected_to b2b_order_path(assigns(:b2b_order))
  end

  test "should destroy b2b_order" do
    assert_difference('B2bOrder.count', -1) do
      delete :destroy, id: @b2b_order
    end

    assert_redirected_to b2b_orders_path
  end
end
