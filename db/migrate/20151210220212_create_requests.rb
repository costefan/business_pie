class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.references :user, index: true
      t.string :text
      t.timestamps null: false
    end
  end
end
