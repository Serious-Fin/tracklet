class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(user_id: current_user.id, contents: params[:post][:contents])

    if @post.save
      flash[:notice] = "Post published!"
      redirect_to posts_url
    else
      flash.now[:notice] = "Fill out the form correctly"
      render :new, status: :unprocessable_entity
    end
  end

  def like
    @post = Post.find(id=params[:id])
    @like = @post.likes.build(user_id: current_user.id)

    if @like.save
      redirect_to posts_url, notice: "Post liked successfully"
    else
      flash[:notice] = "Failed to like post. Try again later"
      redirect_to posts_url
    end
  end

  def dislike
    @post = Post.find(id=params[:id])
    @like = @post.likes.find_by(user_id: current_user.id)
    
    if @like
      @like.destroy
      redirect_to posts_url, notice: "Disliked successfully"
    else
      redirect_to posts_url, notice: "Can't dislike at the moment. Try again later"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:contents)
  end
end
