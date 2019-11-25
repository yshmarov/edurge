class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.text :description, :limit => 500
      t.integer :courses_count, null: false, default: 0

      t.timestamps
    end
  end
end
