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

  private
  def comment_params
    params.require(:comment).permit(:contents)
  end
end
