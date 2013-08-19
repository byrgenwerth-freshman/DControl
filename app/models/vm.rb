#vm.rb
#By: Matt Owens

#Description: This is the model for the VMs in the datacenter.

###############################################################################
class Vm < ActiveRecord::Base
  #Relationship
  belongs_to :hosts

  #Validations
  validates :ip_address, :num_vcpu, presence: true

end
