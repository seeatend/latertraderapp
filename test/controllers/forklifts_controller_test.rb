require 'test_helper'

class ForkliftsControllerTest < ActionController::TestCase
  setup do
    @forklift = forklifts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:forklifts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create forklift" do
    assert_difference('Forklift.count') do
      post :create, forklift: { customer_id: @forklift.customer_id, drop_date_and_time: @forklift.drop_date_and_time, drop_location: @forklift.drop_location, employee_id: @forklift.employee_id, note_to_operator: @forklift.note_to_operator, order_id: @forklift.order_id, pick_up_date_and_time: @forklift.pick_up_date_and_time, pick_up_location: @forklift.pick_up_location, priority: @forklift.priority }
    end

    assert_redirected_to forklift_path(assigns(:forklift))
  end

  test "should show forklift" do
    get :show, id: @forklift
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @forklift
    assert_response :success
  end

  test "should update forklift" do
    patch :update, id: @forklift, forklift: { customer_id: @forklift.customer_id, drop_date_and_time: @forklift.drop_date_and_time, drop_location: @forklift.drop_location, employee_id: @forklift.employee_id, note_to_operator: @forklift.note_to_operator, order_id: @forklift.order_id, pick_up_date_and_time: @forklift.pick_up_date_and_time, pick_up_location: @forklift.pick_up_location, priority: @forklift.priority }
    assert_redirected_to forklift_path(assigns(:forklift))
  end

  test "should destroy forklift" do
    assert_difference('Forklift.count', -1) do
      delete :destroy, id: @forklift
    end

    assert_redirected_to forklifts_path
  end
end
