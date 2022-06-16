class Review < ApplicationRecord
  belongs_to :cooker, class_name: "User"
  validates :content, length: { minimum: 20 }
end
