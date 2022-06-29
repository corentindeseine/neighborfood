class Review < ApplicationRecord
  AUTHORIZED_RATINGS = { '1 - ⭐' => 1,
                         '2 - ⭐⭐' => 2,
                         '3 - ⭐⭐⭐' => 3,
                         '4 - ⭐⭐⭐⭐' => 4,
                         '5 - ⭐⭐⭐⭐⭐' => 5 }

  belongs_to :cooker, class_name: "User"
  belongs_to :user, optional: true
  validates :content, length: { minimum: 3 }
  # validates :rating, inclusion: { in: AUTHORIZED_RATINGS }
end
