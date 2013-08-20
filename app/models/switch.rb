###############################################################################
class Switch < ActiveRecord::Base
  #Attributes
  attr_accessible :model, :location, :ports_attributes
  attr_protected :cisco_pro_name, :cisco_pro_com, :sys_desc, :sys_name,
                  :sys_uptime, :location

  #Relationships
  has_many :switch_modules, :foreign_key => :switch_id
  has_many :ports, :foreign_key => :switch_id

  accepts_nested_attributes_for :switch_modules, :ports

  #Validations

end
