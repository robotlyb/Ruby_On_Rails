require 'test_helper'

class LineItemsControllerTest < ActionController::TestCase
  setup do
    @line_item = line_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:line_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create line_item" do
    assert_difference('LineItem.count') do
      #调用create方法所传递的参数为: product_id
      post :create, :product_id => products(:ruby).id 
    end
    
    #跳转的页面为:cart页面
    assert_redirected_to  store_path 
  end

  test "should show line_item" do
    get :show, :id => @line_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @line_item
    assert_response :success
  end

  test "should update line_item" do
    put :update, :id => @line_item, :line_item => { :cart_id => @line_item.cart_id, :product_id => @line_item.product_id }
    assert_redirected_to line_item_path(assigns(:line_item))
  end

  test "should destroy line_item" do
    assert_difference('LineItem.count', -1) do
      delete :destroy, :id => @line_item
    end

    assert_redirected_to line_items_path
  end

#test for add_to_cart
#test "should create line_item via ajax" do
#   assert_difference('LineItem.count') do
#    xhr :post, :create, :product_id => products(:ruby).id
#  end
#  assert_response :success
#    assert_select_rjs :replace_html, 'cart' do
#      assert_select 'tr#current_item td', /Programming Ruby 1.9/
#    end
#end

end


