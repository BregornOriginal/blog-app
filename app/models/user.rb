class User < ApplicationRecord
  validates :name, presence: true
  validates :posts_counter, comparison: { greater_than_or_equal_to: 0 }

  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'
  has_many :posts, foreign_key: 'author_id'

  def three_recent_post
    posts.last(3)
  end
end
