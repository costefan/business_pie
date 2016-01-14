class ChangeRowInRequest < ActiveRecord::Migration
  def change
    rename_column :requests,:type,:from
  end
end
