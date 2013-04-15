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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130319041245) do

  create_table "flows", :force => true do |t|
    t.string   "source_ip"
    t.string   "source_dns"
    t.integer  "source_port"
    t.string   "destination_ip"
    t.string   "destination_dns"
    t.integer  "destination_port"
    t.string   "byte"
    t.integer  "flows"
    t.integer  "packets"
    t.float    "duration"
    t.string   "protocol"
    t.integer  "rank"
    t.datetime "gathered"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "hosts", :force => true do |t|
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
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  create_table "switches", :force => true do |t|
    t.string   "dns_name"
    t.string   "ip_name"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "vms", :force => true do |t|
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
    t.integer  "host_id"
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
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

end
