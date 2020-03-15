class PostsController < ApplicationController
  
  def index
    @posts = Post.all.limit(6).page(params[:page]).per(6)
  end

  def new
    @post = Post.new
    
  end

  def create
    Post.create(post_params)
  end

  def edit
  end

  def show
  end

  private
  
  def post_params
    params.require(:post).permit(:title, :image, :content,)
  end
end



