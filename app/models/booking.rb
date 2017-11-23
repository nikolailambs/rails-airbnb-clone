class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :office
  has_many :reviews
  has_many :users_reviews, through: :reviews, source: :user

  validates :date_from, presence: true
  validates :date_to, presence: true
end
