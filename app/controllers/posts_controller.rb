class PostsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author: @user).order(id: :asc).limit(2)
    @current_user = current_user
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @comments = @post.comments
    @current_user = current_user
  end

  def new
    @user = current_user
    post = Post.new
    respond_to do |format|
      format.html { render :new, locals: { post: } }
    end
  end

  def create
    post = Post.new(params.require(post_params))
    post.author = current_user
    respond_to do |format|
      format.html do
        if post.save
          flash[:success] = 'Post saved successfully'
          redirect_to users_url
        else
          flash.now[:error] = 'Error: Post could not be saved'
          render :new, status: 422
        end
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:success] = 'The post was successfully destroyed.'

    respond_to do |format|
      format.html { redirect_to user_posts_url }
      format.json { head :no_content }
    end
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
