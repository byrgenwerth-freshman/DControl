###############################################################################
class Switch < ActiveRecord::Base
  #Relationships
  has_many :switch_modules, :foreign_key => :switch_id
  has_many :ports, :foreign_key => :switch_id

  accepts_nested_attributes_for :switch_modules, :ports

  #Validations

end
