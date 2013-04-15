class Flow < ActiveRecord::Base
  attr_accessible :byte, :destination_dns, :destination_ip, :destination_port, :duration, :flows, :gathered, :id, :packets, :protocol, :rank, :source_dns, :source_ip, :source_port
end
