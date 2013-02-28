class Vm < ActiveRecord::Base
  attr_accessible :aggr_commited_storage_space, :aggr_uncommited_storage_space, :aggr_unshared_storage_space, :annotation, :boot_time, :datacenter_id, :description, :dns_name, :guest_family, :guest_os, :guest_state, :host_id, :id, :ip_address, :mem_size_mb, :memory_overhead, :num_disk, :num_nic, :num_vcpu, :power_state, :rank, :resource_group_id, :storage_space_updated_time
end
