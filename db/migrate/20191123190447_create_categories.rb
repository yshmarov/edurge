class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.text :description, :limit => 500

      t.timestamps
    end
  end
end
