require 'test_helper'

class SwitchModulesControllerTest < ActionController::TestCase
  setup do
    @switch_module = switch_modules(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:switch_modules)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create switch_module" do
    assert_difference('SwitchModule.count') do
      post :create, switch_module: { description: @switch_module.description, fw: @switch_module.fw, gathered: @switch_module.gathered, hw: @switch_module.hw, id: @switch_module.id, model: @switch_module.model, serial_num: @switch_module.serial_num, sw: @switch_module.sw, switch_id: @switch_module.switch_id }
    end

    assert_redirected_to switch_module_path(assigns(:switch_module))
  end

  test "should show switch_module" do
    get :show, id: @switch_module
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @switch_module
    assert_response :success
  end

  test "should update switch_module" do
    put :update, id: @switch_module, switch_module: { description: @switch_module.description, fw: @switch_module.fw, gathered: @switch_module.gathered, hw: @switch_module.hw, id: @switch_module.id, model: @switch_module.model, serial_num: @switch_module.serial_num, sw: @switch_module.sw, switch_id: @switch_module.switch_id }
    assert_redirected_to switch_module_path(assigns(:switch_module))
  end

  test "should destroy switch_module" do
    assert_difference('SwitchModule.count', -1) do
      delete :destroy, id: @switch_module
    end

    assert_redirected_to switch_modules_path
  end
end
