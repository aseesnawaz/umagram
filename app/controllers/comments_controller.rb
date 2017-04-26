class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    comment.save
    flash.now[:errors] = comment.errors.full_messages
    redirect_to posts_url
  end

  def update

  end

  def destroy
    comment = Comment.find_by_id(params[:id])
    comment.destroy
    redirect_to posts_url
  end

  def comment_params
    params.require(:comment).permit(:body, :post_id, :user_id)
  end
end
