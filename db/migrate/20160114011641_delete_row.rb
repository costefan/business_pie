class DeleteRow < ActiveRecord::Migration
  def change
    remove_column :requests, :users_id
  end
end
