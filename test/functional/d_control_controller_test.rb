require 'test_helper'

class DControlControllerTest < ActionController::TestCase
  test "getIndex" do
    get :index
    assert_response :success
    assert_not_nil assigns(:posts)

  end


end
