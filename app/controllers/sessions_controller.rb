class SessionsController < ApplicationController
  def new
    @user = User.new
    if logged_in?
      redirect_to posts_url
    else
      render :new
    end
  end

  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if @user
      log_in(@user)
      redirect_to posts_url
    else
      flash.now[:errors] = ["Invalid Credentials"]
      redirect_to root
    end
  end

  def destroy
    log_out
    redirect_to new_session_url
  end
end
