class AddRatingCountersToCourse < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :reviews_count, :integer, default: 0, null: false
    add_column :courses, :average_rating, :float, default: 0, null: false
  end
end
