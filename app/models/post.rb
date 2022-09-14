class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :author, class_name: 'User'
    
  def update_post_counter
    Post.update(postscounter: posts.count)
  end
end
