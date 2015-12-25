class CreateAttendees < ActiveRecord::Migration
  def change
    create_table :attendees do |t|
      t.string :name
      t.text :box
      t.integer :sunami_id

      t.timestamps null: false
    end
  end
end
