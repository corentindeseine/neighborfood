class AddClientToChatrooms < ActiveRecord::Migration[6.1]
  def change
    add_reference :chatrooms, :client, null: false, foreign_key: { to_table: 'users' }
  end
end
