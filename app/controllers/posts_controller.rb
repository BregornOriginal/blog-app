class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    # @post = Post.find(params[:author_id])
    @posts = Post.where(author: @user)
    @comments = Comment.where(author: @post)
  end

  def show; end
end
