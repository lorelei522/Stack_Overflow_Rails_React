class SessionsController < ApplicationController
  def new
  end

  def login_attempt
    authorized_user = User.authenticate(params[:email],params[:login_password])
    if authorized_user
      session[:user_id] = authorized_user.id
      flash[:notice] = "Wow Welcome again, #{authorized_user.username}"
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
