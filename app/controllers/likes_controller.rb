class LikesController < ApplicationController
  def create
    @like = Like.new(user_id: current_user.id, post_id: params[:post_id])

    if @like.save
      redirect_to posts_url
    else
      flash[:notice] = "Oops, something went wrong"
      redirect_to posts_url
    end
  end

  def destroy
    @like = Like.find(user_id=current_user.id, post_id=params[:post_id])
    @like.destroy
    redirect_to posts_url
  end
end
