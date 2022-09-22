class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author: @user).order(id: :asc).limit(2)
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
  end

  def new
  post = Post.new
    respond_to do |format|
      format.html { render :new, locals: { post: post } }
    end
  end

  def create
    # new object from params
    post = Post.new(params.require(:post).permit(:author, :title, :text))
    post.author = current_user
    # respond_to block
    respond_to do |format|
      format.html do
        if post.save
          # success message
          flash[:success] = "Post saved successfully"
          # redirect to index
          redirect_to users_url
        else
          # error message
          flash.now[:error] = "Error: Post could not be saved"
          # render new
          render :new, locals: { post: post }
        end
      end
    end
  end
end
