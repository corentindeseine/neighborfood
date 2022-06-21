class RemoveUserToMeassages < ActiveRecord::Migration[6.1]
  def change
    remove_reference :messages, :user, null: false, foreign_key: true
    add_reference :messages, :client, null: false, foreign_key: { to_table: 'users' }
  end
end
