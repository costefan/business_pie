class AddColumnToTools < ActiveRecord::Migration
  def change
    add_column :tools,:description,:string
  end
end
