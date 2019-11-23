class CreateChapters < ActiveRecord::Migration[5.2]
  def change
    create_table :chapters do |t|
      t.string :name, null: false
      t.integer :number, null: false
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
