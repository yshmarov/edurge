class AddCountersToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :courses_count, :integer, default: 0, null: false
    add_column :users, :subscriptions_count, :integer, default: 0, null: false
  end
end
