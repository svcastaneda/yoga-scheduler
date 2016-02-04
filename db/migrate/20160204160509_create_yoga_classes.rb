class CreateYogaClasses < ActiveRecord::Migration
  def change
    create_table :yoga_classes do |t|
      t.date :date, null: false
      t.time :time, null: false
      t.integer :size, null: false
      t.string :teacher
      t.timestamps null: false
    end
  end
end
