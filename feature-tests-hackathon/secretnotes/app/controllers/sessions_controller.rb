class SessionsController < ApplicationController
  def new
  end
  def create
    @user = User.
      find_by(username: params[:username]).
      try(:authenticate, params[:password])

    if @user
      session[:user_id] = @user.id
      redirect_to user_path @user
    else
      render action: 'new'
    end
  end
  def destroy
    session[:user_id] = nil
    session[:user_type] = nil
    redirect_to root_path
  end
end
