class UsersController < ApplicationController
  def new
    @user =User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:notice]= "Success!"
      flash[:color]="valid"
      redirect_to root_url
    else
      flash[:notice]= "Form is invalid"
      flash[:color]="invalid"
      render "new"
    end
  end

private

  def user_params
     params.require(:user).permit(:username, :email, :password, :salt, :encrypted_password)
  end
end
