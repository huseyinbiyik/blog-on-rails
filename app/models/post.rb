class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  validates :title, presence: true
  validates :title, length: { maximum: 500 }

  def update_posts_counter
    author.update(posts_counter: author.posts.count)
  end

  def last_five_comment
    comments.includes(:post).order(created_at: :desc).limit(5)
  end
end
