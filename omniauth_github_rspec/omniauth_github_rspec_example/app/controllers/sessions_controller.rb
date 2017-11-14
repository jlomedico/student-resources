class SessionsController < ApplicationController
  # login
  def create
    # omniauth stores data in the request env
    auth = request.env["omniauth.auth"]

    # does this user exist?
    user = User.find_by(
      provider: auth['provider'],
      uid: auth['uid']
    )

    if user.nil?
      # create a new user
      user = User.create_with_omniauth(auth)
    end

    session[:user_id] = user.id
    redirect_to root_url, notice: 'Signed in!'
  end

  # logout
  def destroy
    # session[:user_id] = nil
    reset_session
    redirect_to root_url, notice: 'Signed out!'
  end
end
