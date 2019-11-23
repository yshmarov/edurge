class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name, null: false
      t.text :descroption, :limit => 500
      t.text :video_url
      t.references :chapter, foreign_key: true

      t.timestamps
    end
  end
end
