class Meal < ApplicationRecord
  belongs_to :user
  has_many :order_details
end
