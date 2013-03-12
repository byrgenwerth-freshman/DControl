#host.rb
#By: Matt Owens

#Description: This is the model for the Hosts in the datacenter.
#######################################################################################
class Host < ActiveRecord::Base
  attr_accessible :boot_time, :cpu_core_count, :cpu_count, :cpu_hz, :cpu_model, :cpu_power_mgmt_policy, :cpu_power_mgmt_support, :cpu_thread_count, :datacenter_id, :dns_name, :gathered, :hba_count, :host_model, :host_vendor, :id, :ip_address, :last_perf_time, :mem_size, :nic_count, :perf_refresh_rate, :product_api_version, :product_build, :product_fullname, :product_line_id, :product_name, :product_os_type, :product_vendor, :product_version, :rank, :vsid
end
