#host.rb
#By: Matt Owens

#Description: This is the model for the Hosts in the datacenter.
#######################################################################################
class Host < ActiveRecord::Base
  has_many :vms, :foreign_key => :hosts_id
end
