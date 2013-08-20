require 'test_helper'

class SwitchTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "switch test" do
    p switches(:dswitch1)
    p switch_modules(:p_one)
    p ports(:port_one)
    p switches(:dswitch1).ports


  end
end
