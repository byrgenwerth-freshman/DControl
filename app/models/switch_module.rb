###############################################################################
class SwitchModule < ActiveRecord::Base
  #Attributes
  attr_accessible :switch_modules_attributes
  attr_protected :model, :description, :serial_num, :hw, :sw, :fw, :switch_id

  #Relationships
  has_many :ports, :foreign_key => :port_id
  belongs_to :switch

  #Validations

end
