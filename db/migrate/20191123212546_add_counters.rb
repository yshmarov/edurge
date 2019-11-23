class AddCounters < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :courses_count, :integer, null: false, default: 0
    add_column :courses, :tasks_count, :integer, null: false, default: 0
  end
end
