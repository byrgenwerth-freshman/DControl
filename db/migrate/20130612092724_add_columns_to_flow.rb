class AddColumnsToFlow < ActiveRecord::Migration
  def change
  	remove_column :flows, :gathered
  	remove_column :flows, :rank 
  	remove_column :flows, :byte
  	remove_column :flows, :source_dns
  	remove_column :flows, :destination_dns
  	remove_column :flows, :packets
  	remove_column :flows, :id, :source_ip, :source_port, :destination_port, :flows, :packets, :duration, :protocol, :bytes_per_second

  	add_column :flows, :id, :integer
  	add_column :flows, :start_date, :date
  	add_column :flows, :start_time, :time
  	add_column :flows, :end_date, :date
  	add_column :flows, :end_time, :time
  	add_column :flows, :duration, :float
  	add_column :flows, :protocol, :integer
  	add_column :flows, :flag, :string
  	add_column :flows, :source_ip, :string
  	add_column :flows, :source_port, :integer
  	add_column :flows, :in_inf, :integer
  	add_column :flows, :source_as, :integer
  	add_column :flows, :tos, :integer
  	add_column :flows, :destination_ip, :string
  	add_column :flows, :destination_port, :integer
  	add_column :flows, :bytes, :float
  	add_column :flows, :packets, :float
  	add_column :flows, :flows, :integer
  	add_column :flows, :bits_per_second, :float
  	add_column :flows, :packets_per_second, :float
  	add_column :flows, :bytes_per_second, :float
  	add_column :flows, :destination_as, :integer
  	add_column :flows, :out_int, :integer

  	
  	add_column :flows, :bytes_per_packet, :float
  end
end
