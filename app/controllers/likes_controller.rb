class LikesController < ApplicationController
  def create
    @like = Like.new(post_id: params[:post_id], author_id: current_user.id)
    if @like.save
      @like.update_likes_counter
      flash[:success] = 'Post created successfully.'
      redirect_to '/'
    else
      flash[:error] = 'There is an error'
    end
  end
end
