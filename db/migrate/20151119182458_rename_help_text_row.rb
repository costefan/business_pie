class RenameHelpTextRow < ActiveRecord::Migration
  def change
    rename_column :help_texts,:title, :name
  end
end
