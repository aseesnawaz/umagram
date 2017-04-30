class PostsController < ApplicationController
  before_action :require_logged_in!
  def new
    @post = Post.new
  end

  def update
    @post = Post.find(params[:id])
    if @post.like(params[:user_id])
      redirect_to posts_url
    end
  end

  def create
    post = Post.new
    post.user_id = @current_user.id
    post.image = params[:post][:image]
    post.caption = params[:post][:caption]
    post.save!
    redirect_to posts_url
  end

  def index
    @posts = Post.all.order(created_at: :desc)
    @comments = Comment.all
    @users = User.all
  end

  def destroy
    post = Post.find(params[:id])
    post.comments.destroy_all
    post.destroy
    redirect_to posts_url
  end

  def show
    @post = @current_user.posts.all
  end

end
