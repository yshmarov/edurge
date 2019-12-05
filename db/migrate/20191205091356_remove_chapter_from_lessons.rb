class RemoveChapterFromLessons < ActiveRecord::Migration[5.2]
  def change
    remove_column :lessons, :chapter
  end
end
