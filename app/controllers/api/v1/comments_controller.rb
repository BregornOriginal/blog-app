class Api::V1::CommentsController < ApplicationController
  include JsonWebToken
  skip_before_action :verify_authenticity_token
  before_action :authenticate_request
  
  # GET api/v1/users/1/posts/1/comments
  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments
  
    render json: @comments
  end

  # POST api/v1/users/1/posts/1/comments
  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.author = @current_user
    @comment.post = @post

    if @comment.save
      render json: @comment, status: :created
    else
      render json: { errors: @comment.errors.full_messages }, status: :unprocessable_entity
    end
    
    private

    def comment_params
      params.require(:comment).permit(:text)
    end
  end
end
