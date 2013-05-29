class CreateSwitches < ActiveRecord::Migration
  def change
    create_table :switches do |t|
      t.integer :id
      t.string :model
      t.string :cisco_pro_name
      t.string :cisco_pro_com
      t.string :sys_desc
      t.string :sys_name
      t.string :sys_uptime
      t.datetime :gathered
      t.string :location

      t.timestamps
    end
  end
end
