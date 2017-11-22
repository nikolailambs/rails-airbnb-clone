class Office < ApplicationRecord
  belongs_to :user
  has_attachments :photos, maximum: 5
  has_many :bookings
  has_many :messages
  has_many :receive_messages, through: :messages, source: :user
  has_many :user_bookings, through: :bookings, source: :user

  geocoded_by :full_address
  after_validation :geocode,  if: :address_changed?

  def full_address
    [address, city].join(', ')
  end
end


