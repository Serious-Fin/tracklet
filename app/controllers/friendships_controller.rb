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

  def update
    @friendship = Friendship.find(id=params[:id])

    @friendship.status = 'accepted'

    if @friendship.save
      flash[:notice] = "Friend request accepted from #{User.find(id=@friendship.user_id).email}"
      redirect_to users_pending_requests_url
    else
      flash[:notice] = "Something went wrong. Try again later"
      redirect_to users_pending_requests_url
    end
  end

  def destroy
    @friendship = Friendship.find(id=params[:id])
    flash[:notice] = "Declined request from #{User.find(id=@friendship.user_id).email}"
    @friendship.destroy

    redirect_to users_pending_requests_url
  end
end
