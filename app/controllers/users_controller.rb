class UsersController < ApplicationController
  def new
    @user = User.new
    if logged_in?
      redirect_to posts_url
    else
      render :new
    end
  end

  def create
    @user = User.new(user_params)
    @user.avatar = params[:user][:avatar]
    if @user.save
      log_in(@user)
      redirect_to posts_url
    else
      flash[:errors] = @user
      redirect_to new_session_url
    end
  end

  def index
    @users = User.all
    if params[:search]
      @users = User.search(params[:search]).order("created_at DESC")
    else
      @users = User.all.order("created_at DESC")
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    @posts = @user.posts
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def destroy
    user = User.find_by(id: params[:id])
    user.destroy
    log_out
    redirect_to new_user_url
  end

  def update
    @user = User.find_by(id: params[:id])
    user.update(user_params)
  end

  private
  def user_params
    params.require(:user).permit(:firstname, :username, :email, :password)
  end
end
