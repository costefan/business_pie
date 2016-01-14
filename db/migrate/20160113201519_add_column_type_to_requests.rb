class AddColumnTypeToRequests < ActiveRecord::Migration
  def change
    add_column :requests,:type,:string,:limit => 20
  end
end
