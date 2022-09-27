require 'rails_helper'

RSpec.describe 'show page', type: :feature do
  before(:each) do
    @user = User.create(name: 'Julio', bio: 'This is the bio',
                        photo: 'https://i.im.ge/2022/09/22/1Ud6MY.druid.th.png')
    @id = @user.id
  end
  describe 'test' do
    it 'shows user name' do
      visit "users/#{@id}"
      expect(page).to have_content(@user.name)
    end

    it 'shows the posts counter' do
      visit "users/#{@id}"
      expect(page).to have_content(@user.posts_counter)
    end

    it 'shows the user bio' do
      visit "users/#{@id}"
      expect(page).to have_content(@user.bio)
    end

    it 'shows profile picture' do
      visit "users/#{@id}"
      expect(page).to have_css("img[src='#{@user.photo}']")
    end

    describe 'create a post' do
      before(:each) do
        @post = Post.create(title: 'My first post', author: @user, text: 'Text of my first post')
        @post_id = @post.id
      end

      it 'shows last three post' do
        visit "users/#{@id}"
        @user.three_recent_post.each do |post|
          expect(page).to have_content(post.title)
          expect(page).to have_content(post.text)
        end
      end

      it 'redirect to the user post show page' do
        visit "users/#{@id}"
        click_link(@user.name)
        visit "users/#{@id}/posts/#{@post_id}"
      end

      it 'redirect to the user post index page' do
        visit "users/#{@id}"
        click_link('See all posts')
        visit "users/#{@id}/posts"
      end
    end
  end
end
