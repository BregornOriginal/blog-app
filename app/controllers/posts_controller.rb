class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    # @post = Post.find(params[:author_id])
    @posts = Post.where(author: @user).order(id: :asc).limit(2)
  end

  def show
  @post = Post.find(params[:id])
  @comments = @post.comments
  end
end
