class CreateVms < ActiveRecord::Migration
  def change
    create_table :vms do |t|
      t.string :name
      t.string :memory

      t.timestamps
    end
  end
end
