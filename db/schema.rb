# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20130820181516) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "flows", force: true do |t|
    t.string  "destination_ip"
    t.date    "start_date"
    t.time    "start_time"
    t.date    "end_date"
    t.time    "end_time"
    t.float   "duration"
    t.integer "protocol"
    t.string  "flag"
    t.string  "source_ip"
    t.integer "source_port"
    t.integer "in_inf"
    t.integer "source_as"
    t.integer "tos"
    t.integer "destination_port"
    t.float   "bytes"
    t.float   "packets"
    t.integer "flows"
    t.float   "bits_per_second"
    t.float   "packets_per_second"
    t.integer "destination_as"
    t.integer "out_int"
    t.float   "bytes_per_packet"
  end

  create_table "hosts", force: true do |t|
    t.integer  "vsid"
    t.integer  "datacenter_id"
    t.string   "dns_name"
    t.string   "ip_address"
    t.string   "product_name"
    t.string   "product_fullname"
    t.string   "product_vendor"
    t.string   "product_version"
    t.integer  "product_build"
    t.string   "product_os_type"
    t.string   "product_line_id"
    t.float    "product_api_version"
    t.string   "host_vendor"
    t.string   "host_model"
    t.string   "cpu_model"
    t.integer  "cpu_count"
    t.integer  "cpu_core_count"
    t.integer  "cpu_thread_count"
    t.integer  "cpu_hz"
    t.float    "mem_size"
    t.string   "cpu_power_mgmt_policy"
    t.string   "cpu_power_mgmt_support"
    t.integer  "nic_count"
    t.integer  "hba_count"
    t.datetime "last_perf_time"
    t.integer  "perf_refresh_rate"
    t.datetime "boot_time"
    t.integer  "rank"
    t.datetime "gathered"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "ports", force: true do |t|
    t.string   "port"
    t.string   "vlan"
    t.string   "state"
    t.integer  "days_inactive"
    t.string   "speed"
    t.string   "duplex"
    t.string   "port_label"
    t.string   "what_via_cpd"
    t.string   "mac_address"
    t.string   "nic_manufacturer"
    t.string   "ip_address"
    t.string   "dns_name"
    t.datetime "gathered"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "switch_module_id"
    t.integer  "switch_id"
  end

  create_table "switch_modules", force: true do |t|
    t.string   "model"
    t.string   "description"
    t.string   "serial_num"
    t.float    "hw"
    t.string   "sw"
    t.string   "fw"
    t.datetime "gathered"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "switch_id"
  end

  create_table "switches", force: true do |t|
    t.string   "model"
    t.string   "cisco_pro_name"
    t.string   "cisco_pro_com"
    t.string   "sys_desc"
    t.string   "sys_name"
    t.string   "sys_uptime"
    t.datetime "gathered"
    t.string   "location"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "vms", force: true do |t|
    t.integer  "vsid"
    t.integer  "datacenter_id"
    t.boolean  "power_state"
    t.integer  "resource_group_id"
    t.string   "guest_os"
    t.string   "guest_family"
    t.string   "guest_state"
    t.integer  "mem_size_mb"
    t.integer  "num_vcpu"
    t.integer  "num_nic"
    t.integer  "num_disk"
    t.string   "dns_name"
    t.string   "ip_address"
    t.datetime "boot_time"
    t.integer  "memory_overhead"
    t.text     "description"
    t.text     "annotation"
    t.integer  "aggr_commited_storage_space"
    t.integer  "aggr_uncommited_storage_space"
    t.integer  "aggr_unshared_storage_space"
    t.datetime "storage_space_updated_time"
    t.integer  "rank"
    t.datetime "gathered"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "hosts_id"
  end

end
