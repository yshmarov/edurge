class AddReconfirmableToDevise < ActiveRecord::Migration[5.2]
  def up
    add_column :users, :unconfirmed_email, :string # Only if using reconfirmable
    User.update_all confirmed_at: DateTime.now
  end

  def down
    remove_columns :users, :unconfirmed_email # Only if using reconfirmable
  end
end