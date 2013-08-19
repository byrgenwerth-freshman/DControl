#vm.rb
#By: Matt Owens

#Description: This is the model for the VMs in the datacenter.

###############################################################################
class Vm < ActiveRecord::Base
  belongs_to :hosts

end
