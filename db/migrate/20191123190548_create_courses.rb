class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :name, null: false
      t.text :description
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true
      t.integer :subscriptions_count, default: 0, null: false
      t.float :average_rating, default: 0, null: false
      t.boolean :published, default: false
      t.boolean :approved, default: false
      t.string :language, default: "English", null: false
      t.integer :duration, default: 0, null: false
      t.integer :price, default: 0, null: false
      t.text :short_description, :limit => 500
      t.integer :lessons_count, null: false, default: 0

      t.timestamps
    end
  end
end
