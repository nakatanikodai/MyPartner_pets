class PostsController < ApplicationController
  protect_from_forgery
  #before_action :move_to_idnex, except: [:index, :show, :search]
  
  def index
    @posts = Post.all.page(params[:page]).per(12).includes(:user)
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
    post.update(update_params)
    redirect_to post_path(post.id)
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path
  end
ｋ
  def search
    @posts = Post.search(params[:keyword])
  end


  private
  def post_params
    params.require(:post).permit(:partner, :title, :image, :content ).merge(user_id: current_user.id)
  end

  def update_params
    params.permit(:partner, :title, :image, :content ).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end


