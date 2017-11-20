class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :bookings
  has_many :reviews
  has_many :messages
  has_many :offices
  has_many :booked_offices, through: :bookings, source: :office
  has_many :office_messages, through: :messages, source: :office
  has_many :booking_reviews, through: :reviews, source: :bookings

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
