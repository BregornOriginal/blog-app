class Like < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  after_save :update_likes_counter
  after_destroy :update_likes_counter

  validates :author, uniqueness: { scope: :post }

  after_save :update_likes_counter

  private

  def update_likes_counter
    post.increment!(:likes_counter)
  end
end
