class ChangeTableName < ActiveRecord::Migration
  def change
    rename_table :users_tools,:tools_users
  end
end
