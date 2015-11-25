class RenameHelpTextText < ActiveRecord::Migration
  def change
    rename_column :help_texts,:text,:description
  end
end
