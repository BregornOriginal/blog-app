require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /id' do
    it 'returns http success' do
      get '/users/:user_id/posts'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/users/:user_id/posts/:id'
      expect(response).to have_http_status(:success)
    end
  end
  describe 'GET posts' do
    it 'render a template' do
      get '/users/:user_id/posts'
      expect(response).to render_template(:index)
      expect(response.body).to include('User post')
    end
  end
end
