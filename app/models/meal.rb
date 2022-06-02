class Meal < ApplicationRecord
  belongs_to :cooker
  belongs_to :order_detail
end

