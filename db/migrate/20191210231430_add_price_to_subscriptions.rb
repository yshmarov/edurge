class AddPriceToSubscriptions < ActiveRecord::Migration[5.2]
  def change
    add_column :subscriptions, :price, :integer, default: 0, null: false
  end
end
