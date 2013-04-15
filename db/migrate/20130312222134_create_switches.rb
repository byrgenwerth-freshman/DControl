class CreateSwitches < ActiveRecord::Migration
  def change
    create_table :switches do |t|
      t.integer :id
      t.string :dns_name
      t.string :ip_name
      t.string :name

      t.timestamps
    end
  end
end
