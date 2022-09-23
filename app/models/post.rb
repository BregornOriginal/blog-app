class Post < ApplicationRecord
  validates :title, presence: true
  validates :title, length: { maximum: 250 }
  validates :comments_counter, comparison: { greater_than_or_equal_to: 0 }
  validates :likes_counter, comparison: { greater_than_or_equal_to: 0 }

  has_many :comments
  has_many :likes
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  after_save :update_post_counter

  def recent_comments
    comments.last(5)
  end

  private

  def update_post_counter
    author.increment!(:posts_counter)
  end
end
