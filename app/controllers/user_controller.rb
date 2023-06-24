class UserController < ApplicationController
  def add_friends
    @friend_friendships = Friendship.where(user_id: current_user.id).or(Friendship.where(friend_id: current_user.id)).where(status: 'accepted').or(Friendship.where(status: 'pending'))

    @friends = @friend_friendships.map{ |obj| obj.user_id == current_user.id ? obj.friend_id : obj.user_id }

    @non_friends = User.where.not(id: @friends).where.not(id: current_user.id)
  end
end
