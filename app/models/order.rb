class Order < ApplicationRecord
  belongs_to :client, class_name: "User"
  belongs_to :cooker, class_name: "User"
  has_many :order_details, dependent: :destroy
end
