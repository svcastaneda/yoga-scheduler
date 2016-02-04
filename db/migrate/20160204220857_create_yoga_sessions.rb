class CreateYogaSessions < ActiveRecord::Migration
  def change
    create_table :yoga_sessions do |t|
      t.integer :user_id
      t.integer :yoga_class_id

      t.timestamps null: false
    end
  end
end
