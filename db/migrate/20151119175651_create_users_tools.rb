class CreateUsersTools < ActiveRecord::Migration
  def change
    create_table :users_tools do |t|
      t.integer :user_id
      t.integer :tool_id

      t.timestamps null: false
    end
  end
end
