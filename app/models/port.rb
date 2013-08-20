###############################################################################
class Port < ActiveRecord::Base
  #Relationships
  belongs_to :switch_module
  belongs_to :switch

  #Validations
  validates :port, :ip_address, presence: true


end
