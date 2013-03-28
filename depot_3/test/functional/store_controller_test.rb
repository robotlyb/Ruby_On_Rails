require 'test_helper'

class StoreControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    
    #if the second parameter is a number then it'll be treated as a quantity
    #if the second parameter is a string then it'll be treated as expected result
    assert_select '#columns #side a', :minimum => 4
    assert_select '#main .entry', 3 
    assert_select 'h3', 'Programming Ruby 1.9'
    assert_select '.price', /\$[,\d]+\.\d\d/
  end

end
