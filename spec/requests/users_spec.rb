require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /id' do
    it 'returns http success' do
      get '/users/2'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/users'
      expect(response).to have_http_status(:success)
    end
  end
  describe 'GET users' do
    it 'render a template' do
      get '/users'
      expect(response).to render_template(:index)
      expect(response.body).to include('Users list')
    end
  end
end
