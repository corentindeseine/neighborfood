class Chatroom < ApplicationRecord
  belongs_to :cooker, :class_name => "User"
  belongs_to :client, :class_name => 'User'
  has_many :messages, dependent: :destroy
    # after_create_commit { broadcast_append_to "chatrooms"}

    def self.create_private_chatroom(first_user, second_user )
      return if first_user == second_user

      Chatroom.create(client: first_user, cooker: second_user)
    end

    def interlocutor(user)
      ([client, cooker] - [user]).first
    end
end
