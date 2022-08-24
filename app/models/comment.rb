class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def update_comments_counter
    post.update(CommentsCounter: post.comments.count)
  end
end
