require 'test_helper'

class HostsControllerTest < ActionController::TestCase
=begin
  setup do
    @host = hosts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hosts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create host" do
    assert_difference('Host.count') do
      post :create, host: { boot_time: @host.boot_time, cpu_core_count: @host.cpu_core_count, cpu_count: @host.cpu_count, cpu_hz: @host.cpu_hz, cpu_model: @host.cpu_model, cpu_power_mgmt_policy: @host.cpu_power_mgmt_policy, cpu_power_mgmt_support: @host.cpu_power_mgmt_support, cpu_thread_count: @host.cpu_thread_count, datacenter_id: @host.datacenter_id, dns_name: @host.dns_name, gathered: @host.gathered, hba_count: @host.hba_count, host_model: @host.host_model, host_vendor: @host.host_vendor, id: @host.id, ip_address: @host.ip_address, last_perf_time: @host.last_perf_time, mem_size: @host.mem_size, nic_count: @host.nic_count, perf_refresh_rate: @host.perf_refresh_rate, product_api_version: @host.product_api_version, product_build: @host.product_build, product_fullname: @host.product_fullname, product_line_id: @host.product_line_id, product_name: @host.product_name, product_os_type: @host.product_os_type, product_vendor: @host.product_vendor, product_version: @host.product_version, rank: @host.rank, vsid: @host.vsid }
    end

    assert_redirected_to host_path(assigns(:host))
  end

  test "should show host" do
    get :show, id: @host
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @host
    assert_response :success
  end

  test "should update host" do
    put :update, id: @host, host: { boot_time: @host.boot_time, cpu_core_count: @host.cpu_core_count, cpu_count: @host.cpu_count, cpu_hz: @host.cpu_hz, cpu_model: @host.cpu_model, cpu_power_mgmt_policy: @host.cpu_power_mgmt_policy, cpu_power_mgmt_support: @host.cpu_power_mgmt_support, cpu_thread_count: @host.cpu_thread_count, datacenter_id: @host.datacenter_id, dns_name: @host.dns_name, gathered: @host.gathered, hba_count: @host.hba_count, host_model: @host.host_model, host_vendor: @host.host_vendor, id: @host.id, ip_address: @host.ip_address, last_perf_time: @host.last_perf_time, mem_size: @host.mem_size, nic_count: @host.nic_count, perf_refresh_rate: @host.perf_refresh_rate, product_api_version: @host.product_api_version, product_build: @host.product_build, product_fullname: @host.product_fullname, product_line_id: @host.product_line_id, product_name: @host.product_name, product_os_type: @host.product_os_type, product_vendor: @host.product_vendor, product_version: @host.product_version, rank: @host.rank, vsid: @host.vsid }
    assert_redirected_to host_path(assigns(:host))
  end

  test "should destroy host" do
    assert_difference('Host.count', -1) do
      delete :destroy, id: @host
    end

    assert_redirected_to hosts_path
  end
=end
end
