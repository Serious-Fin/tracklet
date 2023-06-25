class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :comments

  validates :contents, presence: true
end
