class Post < ApplicationRecord
  validates :title, presence: true, length: { minimum: 1, maximum: 250 }
  validates :comments_counter, comparison: { greater_than_or_equal_to: 0 }
  validates :likes_counter, comparison: { greater_than_or_equal_to: 0 }

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  after_save :update_posts_counter
  after_destroy :update_posts_counter
  
  def recent_comments
    comments.last(5)
  end

  private

  def update_posts_counter
    author.posts_counter = author.posts.length
    author.save
  end
end
