class FriendshipsController < ApplicationController
  def create
    @friendship = Friendship.new(user_id: params[:sender_id], friend_id: params[:receiver_id], status: 'pending')

    if @friendship.save
      flash[:notice] = "Friend request sent to #{User.find(id=params[:receiver_id]).email}"
      redirect_to users_add_friends_url
    else
      flash[:notice] = "Something went wrong. Try again later"
      redirect_to users_add_friends_url
    end
  end


end
