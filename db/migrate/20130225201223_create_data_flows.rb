class CreateDataFlows < ActiveRecord::Migration
  def change
    create_table :data_flows do |t|

      t.timestamps
    end
  end
end
