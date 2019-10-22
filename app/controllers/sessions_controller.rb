class SessionsController < ApplicationController
  before_action :logged_in_redirect, only: [:new, :create]
  def new
  end
  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      flash[:success] = "Successfully login welcome"
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash.now[:error] = "Error in username or password"
      render :new
    end
  end
  def destroy
    if logged_in?
      flash[:success] = "Successfully log out we wait you thanks"
      session[:user_id] = nil
      redirect_to root_path
    end
  end

  private
  def set_params
    params.require(:session).permit(:username, :password)
  end

  def logged_in_redirect
    if logged_in?
      flash[:error] = "Error to go to login because you're login already"
      redirect_to root_path
    end
  end
end
