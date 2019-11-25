class AddSlugToModels < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :slug, :string
    add_index :users, :slug, unique: true
    add_column :categories, :slug, :string
    add_index :categories, :slug, unique: true
    add_column :courses, :slug, :string
    add_index :courses, :slug, unique: true
    add_column :lessons, :slug, :string
    add_index :lessons, :slug, unique: true
  end
end
