require 'test_helper'

class OffersControllerTest < ActionController::TestCase
  setup do
    @offer = offers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:offers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create offer" do
    assert_difference('Offer.count') do
      post :create, offer: { accepts_offer_below_selling_price: @offer.accepts_offer_below_selling_price, allocated_by: @offer.allocated_by, duration_time: @offer.duration_time, enable_negotitation: @offer.enable_negotitation, ends_at: @offer.ends_at, is_taxable: @offer.is_taxable, market_price: @offer.market_price, min_order_quantity: @offer.min_order_quantity, offer_type: @offer.offer_type, private_offers: @offer.private_offers, quantity_type: @offer.quantity_type, sales_man: @offer.sales_man, selling_price: @offer.selling_price, selling_price_type: @offer.selling_price_type, size_code: @offer.size_code, start_at: @offer.start_at, stock_id: @offer.stock_id, total_quantity_on_offer: @offer.total_quantity_on_offer, visit_store: @offer.visit_store }
    end

    assert_redirected_to offer_path(assigns(:offer))
  end

  test "should show offer" do
    get :show, id: @offer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @offer
    assert_response :success
  end

  test "should update offer" do
    patch :update, id: @offer, offer: { accepts_offer_below_selling_price: @offer.accepts_offer_below_selling_price, allocated_by: @offer.allocated_by, duration_time: @offer.duration_time, enable_negotitation: @offer.enable_negotitation, ends_at: @offer.ends_at, is_taxable: @offer.is_taxable, market_price: @offer.market_price, min_order_quantity: @offer.min_order_quantity, offer_type: @offer.offer_type, private_offers: @offer.private_offers, quantity_type: @offer.quantity_type, sales_man: @offer.sales_man, selling_price: @offer.selling_price, selling_price_type: @offer.selling_price_type, size_code: @offer.size_code, start_at: @offer.start_at, stock_id: @offer.stock_id, total_quantity_on_offer: @offer.total_quantity_on_offer, visit_store: @offer.visit_store }
    assert_redirected_to offer_path(assigns(:offer))
  end

  test "should destroy offer" do
    assert_difference('Offer.count', -1) do
      delete :destroy, id: @offer
    end

    assert_redirected_to offers_path
  end
end
