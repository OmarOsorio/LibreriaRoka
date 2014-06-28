require 'test_helper'

class DetailOrdersControllerTest < ActionController::TestCase
  setup do
    @detail_order = detail_orders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:detail_orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create detail_order" do
    assert_difference('DetailOrder.count') do
      post :create, detail_order: { book_id: @detail_order.book_id, cantidad: @detail_order.cantidad, order_id: @detail_order.order_id }
    end

    assert_redirected_to detail_order_path(assigns(:detail_order))
  end

  test "should show detail_order" do
    get :show, id: @detail_order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @detail_order
    assert_response :success
  end

  test "should update detail_order" do
    patch :update, id: @detail_order, detail_order: { book_id: @detail_order.book_id, cantidad: @detail_order.cantidad, order_id: @detail_order.order_id }
    assert_redirected_to detail_order_path(assigns(:detail_order))
  end

  test "should destroy detail_order" do
    assert_difference('DetailOrder.count', -1) do
      delete :destroy, id: @detail_order
    end

    assert_redirected_to detail_orders_path
  end
end
