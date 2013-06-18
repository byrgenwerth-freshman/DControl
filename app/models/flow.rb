class Flow < ActiveRecord::Base

  #attr_accessible :id, :start_date, :start_time, :end_date, :end_time, :duration, :protocol, :flag, :source_ip, :source_port, :in_inf, :source_as, :tos, :destination_ip, :destination_port, :bytes, :packets, :flows, :bits_per_second, :packets_per_second, :bytes_per_packet, :destination_as, :out_int 
  attr_accessible :byte, :destination_dns, :destination_ip, :destination_port, :duration, :flows, :gathered, :id, :packets, :protocol, :rank, :source_dns, :source_ip, :source_port
end
