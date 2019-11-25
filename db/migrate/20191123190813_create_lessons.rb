class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.string :name, null: false
      t.text :description, :limit => 500
      t.text :video_url
      t.integer :chapter, null: false
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
