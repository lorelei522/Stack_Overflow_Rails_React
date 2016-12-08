class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_username(params[:session][:username])

    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "Welcome Back, #{user.username}!"
      redirect_to questions_path
    else
      flash[:danger] = 'Invalid email/password combination'
      render "new"
    end
  end

  def destroy
    log_out
    redirect_to(:action => 'questions')
  end


end
