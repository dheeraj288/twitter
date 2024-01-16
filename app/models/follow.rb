class Follow < ApplicationRecord
  belongs_to :follower, foreign_key: 'user_id', class_name: 'User', primary_key: :username
  belongs_to :following, foreign_key: 'following_id', class_name: 'User', primary_key: :username

  validates :follower, presence: true
  validates :following, presence: true
  validates :user_id, presence: true, uniqueness: { scope: :following_id }
  validates :following_id, presence: true, uniqueness: { scope: :user_id }
  validate :following_otheruser


  def following_otheruser
    if (follower == following)
      errors.add(:follow, 'You can not follow yourself')
    end
  end
end
