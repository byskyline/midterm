class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :position
      t.timestamps null: false
    end

    add_column :sunamis, :category_id, :integer
    add_index :sunamis, :category_id
  end
end
