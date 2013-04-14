require 'test_helper'

class CartsControllerTest < ActionController::TestCase
  setup do
    @cart = carts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:carts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cart" do
    assert_difference('Cart.count') do
      post :create, :cart => @cart.attribures
    end

    assert_redirected_to cart_path(assigns(:cart))
  end

  test "should show cart" do
    get :show, :id => @cart
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @cart
    assert_response :success
  end

  test "should update cart" do
    put :update, :id => @cart, :cart => {  }
    assert_redirected_to cart_path(assigns(:cart))
  end

  test "should destroy cart" do
    #assert_difference用于验证删除一个cart后,Cart.count与之前的count是否相差-1
    #而在这删除一个cart需要用到当前购物车的信息，而当前购物车的信息是从session中或得，
    #所以需要给session[:cart_id]赋值，使得其有值
    assert_difference('Cart.count', -1) do
      session[:cart_id] = @cart.id 
      delete :destroy, :id => @cart.to_param
    end

    assert_redirected_to store_path
  end
end
