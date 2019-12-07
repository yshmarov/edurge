class ChangeLessonSeqNumber < ActiveRecord::Migration[5.2]
  def change
    remove_column :lessons, :seq_number
    add_column :lessons, :row_order, :integer
  end
end
