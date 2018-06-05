require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post :create, product: { category: @product.category, code: @product.code, image: @product.image, name: @product.name, net_weight: @product.net_weight, order_by: @product.order_by, order_quantity_unit: @product.order_quantity_unit, packs_per_pellets: @product.packs_per_pellets, quality: @product.quality, size: @product.size, size_code: @product.size_code, sku: @product.sku }
    end

    assert_redirected_to product_path(assigns(:product))
  end

  test "should show product" do
    get :show, id: @product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product
    assert_response :success
  end

  test "should update product" do
    patch :update, id: @product, product: { category: @product.category, code: @product.code, image: @product.image, name: @product.name, net_weight: @product.net_weight, order_by: @product.order_by, order_quantity_unit: @product.order_quantity_unit, packs_per_pellets: @product.packs_per_pellets, quality: @product.quality, size: @product.size, size_code: @product.size_code, sku: @product.sku }
    assert_redirected_to product_path(assigns(:product))
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product
    end

    assert_redirected_to products_path
  end
end
