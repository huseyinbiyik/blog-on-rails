class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  def update_counter
    author.update(PostsCounter: author.posts.count)
  end
end
