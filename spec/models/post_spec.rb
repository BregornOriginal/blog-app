require 'rails_helper'

RSpec.describe Post, type: :model do
  subject do
    Post.new(
      author: User.new(
        name: 'Julio',
        photo: 'Url',
        bio: 'Developer',
        posts_counter: 0
      ),
      title: 'This is a title',
      text: 'This is a text',
      comments_counter: 0,
      likes_counter: 0
    )
  end

  before { subject.save }

  describe 'title' do
    it 'should not be empty' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'should have less than 251 chars' do
      subject.title = 'a' * 251
      expect(subject).to_not be_valid
    end
  end

  describe 'comments' do
    it 'should be an integer' do
      expect(subject.comments_counter).to be_an_integer
    end

    it 'should be greater than or equal to 0' do
      expect(subject.comments_counter).to be >= 0
    end
  end

  describe '#recent_comments' do
    it 'should return the last 5 comments' do
      subject.comments.create(text: 'comment1', author: subject.author)
      subject.comments.create(text: 'comment2', author: subject.author)
      subject.comments.create(text: 'comment3', author: subject.author)
      subject.comments.create(text: 'comment4', author: subject.author)
      subject.comments.create(text: 'comment5', author: subject.author)
      subject.comments.create(text: 'comment6', author: subject.author)

      expect(subject.recent_comments.count).to eq(5)
    end
  end

  describe 'likes_counter' do
    it 'should be an integer' do
      expect(subject.likes_counter).to be_an_integer
    end

    it 'should be greater than or equal to 0' do
      expect(subject.likes_counter).to be >= 0
    end
  end
end
