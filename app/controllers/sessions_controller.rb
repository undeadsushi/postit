class SessionsController < ApplicationController
  def new
  end

  def create
  	# ex user.authenticate('password')
    # 1. get user object
    # 2. see if password matches
    # 3. if so, login
    # 4. if not, error message

    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Welcome back!"
      redirect_to root_path
    else
      flash[:error] = "There's something wrong with your username or password."
      redirect_to '/login'
    end

  end

  def destroy
  	session[:user_id] = nil
  	flash[:notice] = "You've logged out"
  	redirect_to root_path
  end
end