require 'test_helper'

class PortsControllerTest < ActionController::TestCase
=begin
  setup do
    @port = ports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create port" do
    assert_difference('Port.count') do
      post :create, port: { days_inactive: @port.days_inactive, dns_name: @port.dns_name, duplex: @port.duplex, gathered: @port.gathered, id: @port.id, ip_address: @port.ip_address, mac_address: @port.mac_address, nic_manufacturer: @port.nic_manufacturer, port: @port.port, port_label: @port.port_label, speed: @port.speed, state: @port.state, vlan: @port.vlan, what_via_cpd: @port.what_via_cpd }
    end

    assert_redirected_to port_path(assigns(:port))
  end

  test "should show port" do
    get :show, id: @port
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @port
    assert_response :success
  end

  test "should update port" do
    put :update, id: @port, port: { days_inactive: @port.days_inactive, dns_name: @port.dns_name, duplex: @port.duplex, gathered: @port.gathered, id: @port.id, ip_address: @port.ip_address, mac_address: @port.mac_address, nic_manufacturer: @port.nic_manufacturer, port: @port.port, port_label: @port.port_label, speed: @port.speed, state: @port.state, vlan: @port.vlan, what_via_cpd: @port.what_via_cpd }
    assert_redirected_to port_path(assigns(:port))
  end

  test "should destroy port" do
    assert_difference('Port.count', -1) do
      delete :destroy, id: @port
    end

    assert_redirected_to ports_path
  end
=end
end
