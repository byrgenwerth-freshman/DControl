class Port < ActiveRecord::Base
  attr_accessible :days_inactive, :dns_name, :duplex, :gathered, :id, :ip_address, :mac_address, :nic_manufacturer, :port, :port_label, :speed, :state, :vlan, :what_via_cpd
end
