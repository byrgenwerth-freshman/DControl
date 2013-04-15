class CreateFlows < ActiveRecord::Migration
  def change
    create_table :flows do |t|
      t.integer :id
      t.string :source_ip
      t.string :source_dns
      t.integer :source_port
      t.string :destination_ip
      t.string :destination_dns
      t.integer :destination_port
      t.string :byte
      t.integer :flows
      t.integer :packets
      t.float :duration
      t.string :protocol
      t.integer :rank
      t.datetime :gathered

      t.timestamps
    end
  end
end
