class PostsController < ApplicationController
  def index
    # @posts = Post.all
    @posts = Post.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(user_id: current_user.id, contents: params[:post][:contents])

    # Check if photo URL is provided
    if params[:post][:image_url].present?
      @photo = Photo.new(image_url: params[:post][:image_url])
      @post.photos << @photo
    end

    if @post.save
      flash[:notice] = "Post published!"
      redirect_to root_path
    else
      flash.now[:notice] = "Fill out the form correctly"
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find(id=params[:id])
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

  def comment
    @post = Post.find(id=params[:id])
    @comment = @post.comments.build(user_id: current_user.id, contents: params[:contents])

    if @comment.save
      redirect_to posts_url, notice: "Comment published!"
    else
      redirect_to posts_url, notice: "Commenting went wrong. Try again later"
    end
  end

  def delete_comment
    @post = Post.find(id=params[:id])
    @comment = @post.comments.find(id=params[:comment_id])

    if @comment
      @comment.destroy
      redirect_to post_url(@post), notice: "Comment deleted successfully"
    else
      redirect_to post_url(@post), notice: "Can't delete comment at the moment."
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:contents)
  end
end
