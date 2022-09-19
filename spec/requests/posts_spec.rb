require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET /id" do
    it "returns http success" do
      get "/posts/id"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/posts/show"
      expect(response).to have_http_status(:success)
    end
  end

end
