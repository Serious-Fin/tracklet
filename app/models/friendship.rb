class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  validates :status, inclusion: { in: ['pending', 'cancelled', 'accepted'] }

  # Returns Friendship objects which are related to current user
  def self.related_friendships(current_user_id)
    where(user_id: current_user_id).or(Friendship.where(friend_id: current_user_id))
  end

  # Returns Friendship objects which are not cancelled (accepted or pending)
  def self.active_friendships
    where(status: ['accepted', 'pending'])
  end
end
