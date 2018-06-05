require 'test_helper'

class SlabsControllerTest < ActionController::TestCase
  setup do
    @slab = slabs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:slabs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create slab" do
    assert_difference('Slab.count') do
      post :create, slab: { from_quantity: @slab.from_quantity, offer_id: @slab.offer_id, to_quantity: @slab.to_quantity, value: @slab.value }
    end

    assert_redirected_to slab_path(assigns(:slab))
  end

  test "should show slab" do
    get :show, id: @slab
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @slab
    assert_response :success
  end

  test "should update slab" do
    patch :update, id: @slab, slab: { from_quantity: @slab.from_quantity, offer_id: @slab.offer_id, to_quantity: @slab.to_quantity, value: @slab.value }
    assert_redirected_to slab_path(assigns(:slab))
  end

  test "should destroy slab" do
    assert_difference('Slab.count', -1) do
      delete :destroy, id: @slab
    end

    assert_redirected_to slabs_path
  end
end
