class PostsController < ApplicationController
  protect_from_forgery
  
  def index
    @posts = Post.all.page(params[:page]).per(6).includes(:user)
  end

  def new
    @post = Post.new
  end

  def create
    Post.create(post_params)
    redirect_to root_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to post_path(post.id)
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    post = Post.find(params[:id])
      post.destroy
      redirect_to root_path
  end



  private
  def post_params
    params.require(:post).permit(:partner, :title, :image, :content ).merge(user_id: current_user.id)
  end
end


