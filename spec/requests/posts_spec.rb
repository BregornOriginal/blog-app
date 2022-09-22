require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /id' do
    it 'returns http success' do
      get '/users/2/posts'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/users/2'
      expect(response).to have_http_status(:success)
    end
  end
  describe 'GET posts' do
    it 'render a template' do
      get '/users/2/posts'
      expect(response).to render_template(:index)
      expect(response.body).to include('Number of posts')
    end
  end
end
