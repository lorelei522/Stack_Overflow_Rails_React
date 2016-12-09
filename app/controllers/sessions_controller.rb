class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
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
    redirect_to questions_path
  end


end
