class AddReference < ActiveRecord::Migration
  def change
    remove_column :requests, :user_id
    add_reference :requests, :users, index: true
  end
end
