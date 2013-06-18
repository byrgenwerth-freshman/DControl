class AddColumnsToFlows < ActiveRecord::Migration
  def change
  	remove_column :flows, :bytes_per_second
  	add_column :flows, :bytes_per_packet, :float
  end
end
