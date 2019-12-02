class AddSeqNumberToLessons < ActiveRecord::Migration[5.2]
  def change
    add_column :lessons, :seq_number, :integer, default: 0, null: false
  end
end
