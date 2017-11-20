class Office < ApplicationRecord
  belongs_to :user
  has_attachment :photo, maximum: 5
  has_many :bookings
  has_many :messages
  has_many :receive_messages, through: :messages, source: :user
  has_many :user_bookings, through: :bookings, source: :user
end
