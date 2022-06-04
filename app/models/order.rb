class Order < ApplicationRecord
  belongs_to :user
  belongs_to :user, class_name: "Cooker"
  has_many :order_details
end
