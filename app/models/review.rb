class Review < ApplicationRecord
  belongs_to :user
  belongs_to :office

  validates :content, length: {maximum: 500 }
end
