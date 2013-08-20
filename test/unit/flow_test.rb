###############################################################################
require 'test_helper'

class FlowTest < ActiveSupport::TestCase
  test "validations" do
    new_flow = flows(:one)

    #Source IP
    new_flow.source_ip = nil
    refute new_flow.valid?
    new_flow.source_ip = "4.4.4.4"
    assert new_flow.valid?


    #Source Port
    new_flow.source_port = nil
    refute new_flow.valid?
    new_flow.source_port = 80
    assert new_flow.valid?

    #Destination IP
    new_flow.destination_ip = nil
    refute new_flow.valid?
    new_flow.destination_ip = "46.43.44.43"
    assert new_flow.valid?

    #Desitnation Port
    new_flow.destination_port = nil
    refute new_flow.valid?
    new_flow.destination_port = 80
    assert new_flow.valid?

  end

end
