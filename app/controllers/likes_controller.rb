class LikesController < ApplicationController
  def create
    @like = Like.new(post_id: params[:post_id], author_id: current_user.id)
    @like.save
  end
end
