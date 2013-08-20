###############################################################################
class Port < ActiveRecord::Base
  #Attributes
  attr_accessible :port, :ip_address
  attr_protected :vlan, :state, :days_inactive, :speed, :duplex, :port_label,
                  :what_via_cpd, :mac_address, :nic_manufacturer, :ip_address,
                  :dns_name, :switch_module_id, :switch_id

  #Relationships
  belongs_to :switch_module
  belongs_to :switch

  #Validations


end
