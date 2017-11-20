class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :office
  has_many :reviews
  has_many :users_reviews, through: :reviews, source: :user
end
