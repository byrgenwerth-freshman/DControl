###############################################################################
require 'test_helper'

class PortTest < ActiveSupport::TestCase
  test "required validations" do
    new_port = ports(:port_one)

    #port validation
    new_port.port = nil
    refute new_port.valid?
    new_port.port = "A"
    assert new_port.valid?


    #ip_address validation
    new_port.ip_address = nil
    refute new_port.valid?
    new_port.ip_address = "5.6.7.9"
    assert new_port.valid?

  end
end
