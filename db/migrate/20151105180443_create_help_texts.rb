class CreateHelpTexts < ActiveRecord::Migration
  def change
    create_table :help_texts do |t|
      t.string :title
      t.text :text
      t.timestamps null: false
    end
  end
end
