class Post < ApplicationRecord
  validates :title, presence: true, length: { minimum: 1, maximum: 250 }
  validates :comments_counter, comparison: { greater_than_or_equal_to: 0 }
  validates :likes_counter, comparison: { greater_than_or_equal_to: 0 }

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  after_save :update_post_counter
  after_destroy :update_post_counter

  def recent_comments
    comments.last(5)
  end

  private

  def update_post_counter
    author.increment!(:posts_counter)
  end
end
