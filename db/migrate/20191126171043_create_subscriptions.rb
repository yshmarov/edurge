class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.integer :rating
      t.text :comment
      t.belongs_to :user, foreign_key: true
      t.belongs_to :course, foreign_key: true

      t.timestamps
    end
  end
end
