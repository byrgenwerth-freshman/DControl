#host.rb
#Description: This is the model for the Hosts in the datacenter.
###############################################################################
class Host < ActiveRecord::Base
  #Attributes
  attr_accessible :ip_address, :cpu_count
  attr_protected :vsid, :datacenter_id, :dns_name, :product_name,
                  :product_fullname, :product_vendor, :product_version,
                  :product_build, :product_os_type, :product_line_id,
                  :product_api_version, :host_vendor, :host_model, :cpu_model,
                  :cpu_core_count, :cpu_thread_count, :cpu_hz, :mem_size,
                  :cpu_power_mgmt_policy, :cpu_power_mgmt_support, :nic_count,
                  :hba_count, :last_perf_time, :perf_refresh_rate, :boot_time,
                  :rank

  #Relationship
  has_many :vms

  #Validations
  validates :ip_address, :cpu_count, presence: true

end
