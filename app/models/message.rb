class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :client, class_name: 'User'
end
