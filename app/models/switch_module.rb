###############################################################################
class SwitchModule < ActiveRecord::Base
  #Relationships
  has_many :ports, :foreign_key => :port_id
  belongs_to :switch

  #Validations

end
