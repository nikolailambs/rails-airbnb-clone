class Message < ApplicationRecord
  belongs_to :user
  belongs_to :office

  # validates :title, presence: true
  # validates :title, length: { minimum: 3, maximum: 50 }
  # validates :content, presence: true
  # validates :content, length: { minimum: 3, maximum: 500 }
end
