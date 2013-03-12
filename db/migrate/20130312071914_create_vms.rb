class CreateVms < ActiveRecord::Migration
  def change
    create_table :vms do |t|
      t.integer :id
      t.integer :vsid
      t.integer :datacenter_id
      t.boolean :power_state
      t.integer :resource_group_id
      t.string :guest_os
      t.string :guest_family
      t.string :guest_state
      t.integer :mem_size_mb
      t.integer :num_vcpu
      t.integer :num_nic
      t.integer :num_disk
      t.string :dns_name
      t.integer :host_id
      t.string :ip_address
      t.datetime :boot_time
      t.integer :memory_overhead
      t.text :description
      t.text :annotation
      t.integer :aggr_commited_storage_space
      t.integer :aggr_uncommited_storage_space
      t.integer :aggr_unshared_storage_space
      t.datetime :storage_space_updated_time
      t.integer :rank
      t.datetime :gathered

      t.timestamps
    end
  end
end
