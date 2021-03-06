class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :bookings
  has_many :reviews
  has_many :messages
  has_many :offices
  has_many :booked_offices, through: :bookings, source: :office
  has_many :office_messages, through: :messages, source: :office # from provider to user
  has_many :booking_reviews, through: :reviews, source: :bookings

  devise :omniauthable, omniauth_providers: [:facebook]
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  def self.find_for_facebook_oauth(auth)
    user_params = auth.slice(:provider, :uid)
    user_params.merge! auth.info.slice(:email, :first_name, :last_name)
    user_params[:facebook_picture_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
    user_params = user_params.to_h

    user = User.find_by(provider: auth.provider, uid: auth.uid)
    user ||= User.find_by(email: auth.info.email) # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save
    end

    return user
  end


  def avatar
    self.facebook_picture_url || "https://api.adorable.io/avatars/285/#{self.email}.png"
  end


end
