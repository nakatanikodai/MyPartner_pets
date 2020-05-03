class CommentsController < ApplicationController
  
  def create
    comment = Comment.create(comment_params)
    redirect_to "/posts/#{comment.post.id}"
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to root_path
  end


  private
  def comment_params
    params.require(:comment).permit(:detail).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end
