class Api::V1::PostsController < ApplicationController

  # GET api/v1/users/1/posts/

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  
    render json: @posts 
  end
end
