class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :orders
  has_many :meals, dependent: :destroy
  has_many :clients, class_name: "Order", foreign_key: "client_id"
  has_many :cookers, class_name: "Order", foreign_key: "cooker_id"

  validates :first_name, presence: true
  validates :last_name, presence: true
  # validates :address, presence: true
  validates :city, presence: true
  validates :zip_code, presence: true, format: { with: /\d{5}/ }
  validates :email, presence: true, uniqueness: true
  validates :phone_number, presence: true, format: { with: /\A((\+)33|0|0033)[1-9](\d{2}){4}\z/ }

  def self.cookers
    Meal.all.map(&:user).uniq
  end
end
