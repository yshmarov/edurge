class ChangeTasksToLessons < ActiveRecord::Migration[5.2]
  def change
    rename_table :tasks, :lessons
  end
end
