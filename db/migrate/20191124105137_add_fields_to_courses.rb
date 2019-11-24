class AddFieldsToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :published, :boolean, default: false
    add_column :courses, :approved, :boolean, default: false
    add_column :courses, :language, :string, default: "English", null: false
    add_column :courses, :duration, :integer, default: 0, null: false
    add_column :courses, :price, :integer, default: 0, null: false
    add_column :courses, :short_description, :text, :limit => 500
  end
end
