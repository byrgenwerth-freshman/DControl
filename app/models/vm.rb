#vm.rb
#Description: This is the model for the VMs in the datacenter.
###############################################################################
class Vm < ActiveRecord::Base
  #Attributes
  attr_accessible :ip_address
  attr_protected :vsid, :datacenter_id, :power_state, :resource_group_id,
                  :guest_os, :guest_family, :guest_state, :mem_size_mb,
                  :num_vcpu, :num_nic, :num_disk, :dns_name, :boot_time,
                  :memory_overhead, :description, :annotation,
                  :aggr_commited_storage_space, :aggr_uncommited_storage_space,
                  :aggr_unshared_storage_space, :storage_space_updated_time,
                  :rank, :hosts_id


  #Relationship
  belongs_to :hosts

  #Validations
  validates :ip_address, :num_vcpu, presence: true

end
