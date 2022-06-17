class Review < ApplicationRecord
  belongs_to :cooker, class_name: "User"
  belongs_to :user, optional: true
  validates :content, length: { minimum: 3 }
end
