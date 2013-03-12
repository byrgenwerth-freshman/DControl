class CreateHosts < ActiveRecord::Migration
  def change
    create_table :hosts do |t|
      t.integer :id
      t.integer :vsid
      t.integer :datacenter_id
      t.string :dns_name
      t.string :ip_address
      t.string :product_name
      t.string :product_fullname
      t.string :product_vendor
      t.string :product_version
      t.integer :product_build
      t.string :product_os_type
      t.string :product_line_id
      t.float :product_api_version
      t.string :host_vendor
      t.string :host_model
      t.string :cpu_model
      t.integer :cpu_count
      t.integer :cpu_core_count
      t.integer :cpu_thread_count
      t.integer :cpu_hz
      t.float :mem_size
      t.string :cpu_power_mgmt_policy
      t.string :cpu_power_mgmt_support
      t.integer :nic_count
      t.integer :hba_count
      t.datetime :last_perf_time
      t.integer :perf_refresh_rate
      t.datetime :boot_time
      t.integer :rank
      t.datetime :gathered

      t.timestamps
    end
  end
end
