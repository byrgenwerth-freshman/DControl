###############################################################################
class Flow < ActiveRecord::Base
   #Attributes
   attr_accessible :destination_ip, :destination_port, :source_ip, :source_port
   attr_protected :start_date, :start_time, :end_date,:end_time, :duration,
                  :protocol, :flag, :in_inf, :source_as, :tos, :bytes,
                  :packets, :flows, :bits_per_second, :packets_per_second,
                  :destination_as, :out_int, :bytes_per_packet

  #Relationships

  #Validations


end
