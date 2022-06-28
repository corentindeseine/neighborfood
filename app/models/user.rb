class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  # Devise / User
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def full_name
    "#{first_name.capitalize} #{last_name}"
  end

  # Geocoding
  geocoded_by :full_street_address
  after_validation :geocode, if: :will_save_change_to_address?

  def full_street_address
    "#{address}, #{zip_code}, #{city}"
  end

  # Foreign key
  has_many :orders, class_name: "Order", foreign_key: "client_id"
  has_many :meals, dependent: :destroy
  # has_many :clients, class_name: "Order", foreign_key: "client_id"
  # has_many :cookers, class_name: "Order", foreign_key: "cooker_id"
  has_many :reviews, class_name: "Review", foreign_key: "cooker_id", dependent: :destroy
  has_many :messages, through: :chatrooms
  has_many :chatrooms_as_client, class_name: 'Chatroom', foreign_key: 'client_id', dependent: :destroy
  has_many :chatrooms_as_cooker, class_name: 'Chatroom', foreign_key: 'cooker_id', dependent: :destroy

  # Cloudinary
  has_one_attached :image

  # Validations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :city, presence: true
  validates :zip_code, presence: true, format: { with: /\d{5}/ }
  validates :email, presence: true, uniqueness: true
  validates :phone_number, presence: true, format: { with: /\A((\+)33|0|0033)[1-9](\d{2}){4}\z/ }

  def self.cookers
    User.left_joins(:meals).where('meals.id IS NOT NULL').distinct
  end

  def chatrooms
    chatrooms_as_client + chatrooms_as_cooker
  end

  def average_rating
    reviews.average(:rating).round(1) unless reviews.empty?
  end

  def current_order
    orders.find { |e| e.status.zero? } || false
  end
end
