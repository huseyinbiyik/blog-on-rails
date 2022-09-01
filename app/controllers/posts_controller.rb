class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @user_posts = @user.posts
    @comments = Comment.all
  end

  def show
    @user = User.find(params[:user_id])
    @user_posts = @user.posts
    @post = @user_posts.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(title: params[:post][:title], text: params[:post][:text], author_id: current_user.id)
    if @post.save
      redirect_to "/users/#{current_user.id}/posts"

    else
      render :new
    end
  end
end
