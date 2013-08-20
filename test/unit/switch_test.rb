require 'test_helper'

class SwitchTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "required validations" do
    new_switch = switches(:dswitch1)

    #Validate model
    new_switch.model = nil
    refute new_switch.valid?
    new_switch.model = "Switch1"
    assert new_switch.valid?

    #Validate sys_uptime
    new_switch.sys_uptime = nil
    refute new_switch.valid?
    new_switch.sys_uptime = "5h"
    assert new_switch.valid?

    #Validate location
    new_switch.location = nil
    refute new_switch.valid?
    new_switch.location = "Admin Center"
    assert new_switch.valid?


  end
end
