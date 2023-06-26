class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :comments

  validates :contents, presence: true

  def liked_by_user?(user)
    likes.exists?(user_id: user.id)
  end
end
