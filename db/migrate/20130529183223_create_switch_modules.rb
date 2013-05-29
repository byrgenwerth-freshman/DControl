class CreateSwitchModules < ActiveRecord::Migration
  def change
    create_table :switch_modules do |t|
      t.integer :id
      t.string :model
      t.string :description
      t.string :serial_num
      t.float :hw
      t.string :sw
      t.string :fw
      t.integer :switch_id
      t.datetime :gathered

      t.timestamps
    end
  end
end
