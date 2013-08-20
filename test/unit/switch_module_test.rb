require 'test_helper'

class SwitchModuleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "required validations" do
    new_sm = switch_modules(:p_one)

    #Validate model name
    new_sm.model = nil
    refute new_sm.valid?
    new_sm.model = "switch_module1"
    assert new_sm.valid?

  end
end
