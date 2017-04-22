class UsersController < ApplicationController
  def new
    @user = User.new
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

  def destroy

  end

  def update

  end

  private
  def user_params
    params.require(:user).permit(:firstname, :username, :email, :password)
  end
end
