require 'test_helper'

class VmsControllerTest < ActionController::TestCase
=begin
  setup do
    @vm = vms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vm" do
    assert_difference('Vm.count') do
      post :create, vm: { aggr_commited_storage_space: @vm.aggr_commited_storage_space, aggr_uncommited_storage_space: @vm.aggr_uncommited_storage_space, aggr_unshared_storage_space: @vm.aggr_unshared_storage_space, annotation: @vm.annotation, boot_time: @vm.boot_time, datacenter_id: @vm.datacenter_id, description: @vm.description, dns_name: @vm.dns_name, gathered: @vm.gathered, guest_family: @vm.guest_family, guest_os: @vm.guest_os, guest_state: @vm.guest_state, host_id: @vm.host_id, id: @vm.id, ip_address: @vm.ip_address, mem_size_mb: @vm.mem_size_mb, memory_overhead: @vm.memory_overhead, num_disk: @vm.num_disk, num_nic: @vm.num_nic, num_vcpu: @vm.num_vcpu, power_state: @vm.power_state, rank: @vm.rank, resource_group_id: @vm.resource_group_id, storage_space_updated_time: @vm.storage_space_updated_time, vsid: @vm.vsid }
    end

    assert_redirected_to vm_path(assigns(:vm))
  end

  test "should show vm" do
    get :show, id: @vm
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vm
    assert_response :success
  end

  test "should update vm" do
    put :update, id: @vm, vm: { aggr_commited_storage_space: @vm.aggr_commited_storage_space, aggr_uncommited_storage_space: @vm.aggr_uncommited_storage_space, aggr_unshared_storage_space: @vm.aggr_unshared_storage_space, annotation: @vm.annotation, boot_time: @vm.boot_time, datacenter_id: @vm.datacenter_id, description: @vm.description, dns_name: @vm.dns_name, gathered: @vm.gathered, guest_family: @vm.guest_family, guest_os: @vm.guest_os, guest_state: @vm.guest_state, host_id: @vm.host_id, id: @vm.id, ip_address: @vm.ip_address, mem_size_mb: @vm.mem_size_mb, memory_overhead: @vm.memory_overhead, num_disk: @vm.num_disk, num_nic: @vm.num_nic, num_vcpu: @vm.num_vcpu, power_state: @vm.power_state, rank: @vm.rank, resource_group_id: @vm.resource_group_id, storage_space_updated_time: @vm.storage_space_updated_time, vsid: @vm.vsid }
    assert_redirected_to vm_path(assigns(:vm))
  end

  test "should destroy vm" do
    assert_difference('Vm.count', -1) do
      delete :destroy, id: @vm
    end

    assert_redirected_to vms_path
  end
=end
end
