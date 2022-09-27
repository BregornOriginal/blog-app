require 'rails_helper'

RSpec.describe 'index page', type: :feature do
  describe 'test' do
    before(:each) do
      @user = User.create(name: 'Julio', bio: 'This is the bio',
                          photo: 'https://i.im.ge/2022/09/22/1Ud6MY.druid.th.png')
      @id = @user.id
    end

    it 'shows user name' do
      visit users_path
      expect(page).to have_content(@user.name)
    end

    it 'shows the posts counter' do
      visit users_path
      expect(page).to have_content(@user.posts_counter)
    end

    it 'shows profile picture' do
      visit users_path
      expect(page).to have_css("img[src='#{@user.photo}']")
    end

    it 'redirect to show page' do
      visit users_path
      click_link(@user.name)
      expect(page).to have_content('bio')
    end
  end
end
