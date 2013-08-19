###############################################################################
require 'test_helper'

class HostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "reqired validations" do
    new_host = hosts(:watcher1)

    #For IP address
    new_host.ip_address = nil
    refute new_host.valid?
    new_host.ip_address = "3.3.3.3"
    assert new_host.valid?

    #For CPU count
    new_host.cpu_count = nil
    refute new_host.valid?
    new_host.cpu_count = 2
    assert new_host.valid?



  end

end
