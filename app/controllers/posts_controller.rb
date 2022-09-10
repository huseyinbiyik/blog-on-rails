class PostsController < ApplicationController
  def index
    @user = User.includes(:posts, :comments).find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @user = User.includes(:posts).find(params[:user_id])
    @user_posts = @user.posts
    @post = @user_posts.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(title: params[:post][:title], text: params[:post][:text], author_id: current_user.id)
    if @post.save
      flash[:notice] = 'Post successfully added!'
      redirect_to "/users/#{current_user.id}/posts"

    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    authorize! :destroy, @post
    @post.destroy
    flash[:notice] = 'Post Deleted Successfully'
    redirect_back fallback_location: root_path
  end
end
