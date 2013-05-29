class CreatePorts < ActiveRecord::Migration
  def change
    create_table :ports do |t|
      t.integer :id
      t.string :port
      t.string :vlan
      t.string :state
      t.integer :days_inactive
      t.string :speed
      t.string :duplex
      t.string :port_label
      t.string :what_via_cpd
      t.string :mac_address
      t.string :nic_manufacturer
      t.string :ip_address
      t.string :dns_name
      t.datetime :gathered

      t.timestamps
    end
  end
end
