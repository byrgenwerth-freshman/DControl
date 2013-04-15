require 'test_helper'

class SwitchesControllerTest < ActionController::TestCase
=begin
  setup do
    @switch = switches(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:switches)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create switch" do
    assert_difference('Switch.count') do
      post :create, switch: { dns_name: @switch.dns_name, id: @switch.id, ip_name: @switch.ip_name, name: @switch.name }
    end

    assert_redirected_to switch_path(assigns(:switch))
  end

  test "should show switch" do
    get :show, id: @switch
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @switch
    assert_response :success
  end

  test "should update switch" do
    put :update, id: @switch, switch: { dns_name: @switch.dns_name, id: @switch.id, ip_name: @switch.ip_name, name: @switch.name }
    assert_redirected_to switch_path(assigns(:switch))
  end

  test "should destroy switch" do
    assert_difference('Switch.count', -1) do
      delete :destroy, id: @switch
    end

    assert_redirected_to switches_path
  end
=end
end
