class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    comment.save!
    respond_to do |format|
      format.html {redirect_to posts_url}
      format.json {render json: comment}
    end
  end

  def update
  end
  #
  # def show
  #   @comment = Comment.find(params[:id])
  #   respond_to do |format|
  #     format.html {render :show}
  #     format.json {render json: @comment}
  #   end
  # end

  def destroy
    comment = Comment.find_by_id(params[:id])
    comment.destroy
    redirect_to posts_url
  end

  def comment_params
    params.require(:comment).permit(:body, :post_id, :user_id)
  end
end
