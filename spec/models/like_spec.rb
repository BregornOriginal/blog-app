require 'rails_helper'

RSpec.describe Like, type: :model do
  user = User.new(
    name: 'Julio',
    photo: 'Url',
    bio: 'Developer',
    posts_counter: 0
  )

  subject do
    Like.new(
      post: Post.new(
        author: user,
        title: 'This is a title',
        text: 'This is a text',
        comments_counter: 0,
        likes_counter: 0
      ),
      author: user
    )
  end

  describe '#update_likes_counter' do
    it 'should update the likes counter' do
      expect(subject.send(:update_likes_counter)).to be_valid
    end
  end
end
