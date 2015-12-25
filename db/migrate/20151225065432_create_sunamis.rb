class CreateSunamis < ActiveRecord::Migration
  def change
    create_table :sunamis do |t|
      t.string :title
      t.text :box
      t.datetime :time

      t.timestamps null: false
    end
  end
end
