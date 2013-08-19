require 'test_helper'

class VMTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "required validations" do
    new_vm = vms(:vm_one)

    #For IP address
    new_vm.ip_address = nil
    refute new_vm.valid?
    new_vm.ip_address = "3.3.3.3"
    assert new_vm.valid?

    #For CPU count
    new_vm.num_vcpu = nil
    refute new_vm.valid?
    new_vm.num_vcpu = 2
    assert new_vm.valid?
  end
end
