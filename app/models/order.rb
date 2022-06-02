class Order < ApplicationRecord
  belongs_to :user
  belongs_to :cooker
  has_many :order_details
end
