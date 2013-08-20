###############################################################################
class Flow < ActiveRecord::Base
  #Relationships

  #Validations
  validates :destination_ip, :destination_port, :source_ip, :source_port,
              presence: true


end
