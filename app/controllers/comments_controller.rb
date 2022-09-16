class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(post_id: params[:post_id], author_id: current_user.id, text: params[:text])
    if @comment.save
      @comment.update_comments_counter
      redirect_to '/'
    else
      flash[:error] = 'There is an error'
    end
  end
end
