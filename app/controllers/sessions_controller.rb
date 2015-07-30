class SessionsController < ApplicationController

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  def new
    @user = User.new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "Welcome, #{user.username}"
      redirect_to user
    else
      flash.now[:notice] = "There is no user by that username"
      render :new
    end
  end

end