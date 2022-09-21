class UsersController < ApplicationController
  def index
    @users = User.all
    # @user = User.find_by(id: params[:user_id])
  end

  def show
    @user = User.find(params[:id])
    @posts = Post.where(author: @user).order(id: :asc).limit(3)
  end
end
