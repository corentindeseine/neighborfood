class Meal < ApplicationRecord
  belongs_to :user
  has_many :order_details
  has_one_attached :image
end
