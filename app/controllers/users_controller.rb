class UsersController < ApplicationController
  def add_friends
    @related_friendship_objects = Friendship.related_friendships(current_user.id).active_friendships

    @friends = @related_friendship_objects.map{ |obj| obj.user_id == current_user.id ? obj.friend_id : obj.user_id }

    @non_friends = User.where.not(id: @friends).where.not(id: current_user.id)
  end

  def pending_requests
    @pending_friendship_objects = Friendship.incoming_friendships(current_user.id).pending_friendships
  end

  def show
    @user = User.find(id=current_user.id)
  end
end
