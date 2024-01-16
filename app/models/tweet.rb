class Tweet < ApplicationRecord
  validates :message, presence: true, length: {maximum: 280}
  has_one_attached :image
  belongs_to :user
end
