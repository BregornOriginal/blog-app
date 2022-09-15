class Like < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  # def self.update_likes_counter(post)
  #   post.likes_counter = Like.where(author: post).count
  # end

  after_save :update_likes_counter

  private

  def update_likes_counter
    post.increment!(:likes_counter)
  end
end
