class RenameCourseTasksCountToLessonsCount < ActiveRecord::Migration[5.2]
  def change
    rename_column :courses, :tasks_count, :lessons_count
  end
end
