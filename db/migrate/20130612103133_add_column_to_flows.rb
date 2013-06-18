class AddColumnToFlows < ActiveRecord::Migration
  def change
  	remove_column :flows, :created_at, :updated_at
  end
end
