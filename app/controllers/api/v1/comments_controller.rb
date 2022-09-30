class Api::V1::CommentsController < ApplicationController

  # GET api/v1/users/1/posts/1/comments
  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments
  
    render json: @comments
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.create(text: 'New Comment',
      author: User.find(1), post: @post)

    render json: @comment

  end
end
