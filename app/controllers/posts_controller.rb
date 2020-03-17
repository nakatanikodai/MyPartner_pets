class PostsController < ApplicationController
  protect_from_forgery
  
  def index
    @posts = Post.all.page(params[:page]).per(6)
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

  def show
    @post = Post.find(params[:id])
  end

  def destroy

  end



  private
  def post_params
    params.require(:post).permit(:title, :image, :content, :partner)
  end
  
end



