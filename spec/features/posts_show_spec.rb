require 'rails_helper'

RSpec.describe 'show page', type: :feature do
  before(:each) do
    @user = User.create(name: 'Julio', bio: 'This is the bio',
                        photo: 'https://i.im.ge/2022/09/22/1Ud6MY.druid.th.png')
    @id = @user.id
  end

  describe 'create a post' do
    before(:each) do
      @post = Post.create(title: 'My first post', author: @user, text: 'Text of my first post')
      @post_id = @post.id
      @comment = Comment.create(post: @post, author: @user,
                                text: 'Restoration is an excelent option when you have to go to raids!')
    end

    it 'show a post title' do
      visit "users/#{@id}/posts/#{@post_id}"
      expect(page).to have_content(@post.title)
    end

    it 'there is a section for pagination' do
      visit "users/#{@id}/posts/#{@post_id}"
      expect(page).to have_content(@post.author.name)
    end

    it 'shows the amounts of comments' do
      visit "users/#{@id}/posts/#{@post_id}"
      expect(page).to have_content(@post.comments_counter)
    end
  end
end
