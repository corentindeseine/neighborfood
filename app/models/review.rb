class Review < ApplicationRecord
  belongs_to :cooker, class_name: "User"
  validates :content, length: { minimum: 3 }
end
