class User < ApplicationRecord
  has_many :comments, foreign_key: :author_id
  has_many :posts, foreign_key: :author_id
  has_many :likes, foreign_key: :author_id

  validates :name, presence: true
  validates :posts_counter, numericality: { allow_blank: true, greater_than_or_equal_to: 0 }

  def three_recent_posts
    posts.includes(:author).order(created_at: :desc).limit(3)
  end
end
