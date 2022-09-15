require 'rails_helper'

RSpec.describe Like, type: :model do
  subject do
    User.new(
      name: 'Julio',
      photo: 'Url',
      bio: 'Developer',
      posts_counter: 0
    )
  end

  before { subject.save }

  describe 'name' do
    it 'should not be nil' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
  end

  describe 'posts_counter' do
    it 'should be an integer' do
      expect(subject.posts_counter).to be_an_integer
    end
    it 'should be greater than or equal to 0' do
      expect(subject.posts_counter).to be >= 0
    end
  end

  describe '#three_recent_post' do
    it 'should return the last 3 posts' do
      subject.posts.create(title: 'title', text: 'text', comments_counter: 0, likes_counter: 0)
      subject.posts.create(title: 'title2', text: 'text', comments_counter: 0, likes_counter: 0)
      subject.posts.create(title: 'title3', text: 'text', comments_counter: 0, likes_counter: 0)
      subject.posts.create(title: 'title4', text: 'text', comments_counter: 0, likes_counter: 0)
      subject.posts.create(title: 'title5', text: 'text', comments_counter: 0, likes_counter: 0)

      expect(subject.three_recent_post.count).to eq(3)
    end
  end
end
