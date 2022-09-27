require 'rails_helper'

RSpec.describe 'show page', type: :feature do
  before(:each) do
    @user = User.create(name: 'Julio', bio: 'This is the bio',
                        photo: 'https://i.im.ge/2022/09/22/1Ud6MY.druid.th.png')
    @id = @user.id
  end
  describe 'test' do
    it 'shows user name' do
      visit "users/#{@id}/posts"
      expect(page).to have_content(@user.name)
    end

    it 'shows the posts counter' do
      visit "users/#{@id}/posts"
      expect(page).to have_content(@user.posts_counter)
    end

    it 'shows profile picture' do
      visit "users/#{@id}/posts"
      expect(page).to have_css("img[src='#{@user.photo}']")
    end

    describe 'create a post' do
      before(:each) do
        @post = Post.create(title: 'My first post', author: @user, text: 'Text of my first post')
        @post_id = @post.id
      end

      it 'shows string posts' do
        visit "users/#{@id}/posts"
        expect(page).to have_selector('h1', text: 'Posts')
      end

      it 'show a post title' do
        visit "users/#{@id}/posts"
        expect(page).to have_content(@post.title)
      end

      it 'shows the amounts of comments' do
        visit "users/#{@id}/posts"
        expect(page).to have_content(@post.comments_counter)
      end

      it 'shows the amounts of likes' do
        visit "users/#{@id}/posts"
        expect(page).to have_content(@post.likes_counter)
      end

      it 'there is a section for pagination' do
        visit "users/#{@id}/posts"
        expect(page).to have_xpath("//a[contains(.,'Pagination')]")
      end

      it 'redirect to the user post show page' do
        visit "users/#{@id}/posts"
        click_link(@user.name)
        visit "users/#{@id}/posts/#{@post_id}"
      end
    end
  end
end
