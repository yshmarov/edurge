class CreateUserLesson < ActiveRecord::Migration[5.2]
  def change
    create_table :user_lessons do |t|
      t.references :user, foreign_key: true
      t.references :lesson, foreign_key: true
    end
  end
end
