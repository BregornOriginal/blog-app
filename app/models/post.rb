class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :author, class_name: 'User', foreign_key: :author_id
    
  # def self.update_post_counter(user)
  #   user.posts_counter = Post.where(author: user).count
  # end

  after_save :update_post_counter

  private

  def update_post_counter
    author.increment!(:posts_counter)
  end

  def recent_comments
    Comment.last(5)
  end
end
